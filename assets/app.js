(() => {
  const html = document.documentElement;
  const saved = localStorage.getItem('korp-lang');
  const initial = saved || 'th';
  html.classList.add(`lang-${initial}`);
  html.setAttribute('lang', initial === 'th' ? 'th' : 'en');

  const messages = {
    th: {
      sending: 'กำลังส่งข้อมูล...',
      success: 'ส่งข้อมูลเรียบร้อยแล้ว ทีมจะใช้ข้อมูลนี้เป็น brief เบื้องต้นสำหรับ follow-up',
      error: 'ส่งข้อมูลไม่สำเร็จ ลองใหม่อีกครั้ง หรือทักผ่าน Facebook Page'
    },
    en: {
      sending: 'Submitting your brief...',
      success: 'Your brief has been submitted successfully. The team can now review it for follow-up.',
      error: 'Submission failed. Please try again or contact us via Facebook Page.'
    }
  };

  const getCurrentLang = () => html.classList.contains('lang-en') ? 'en' : 'th';

  const setLang = (lang) => {
    html.classList.remove('lang-th', 'lang-en');
    html.classList.add(`lang-${lang}`);
    html.setAttribute('lang', lang === 'th' ? 'th' : 'en');
    localStorage.setItem('korp-lang', lang);
    document.querySelectorAll('[data-toggle-lang]').forEach((btn) => {
      btn.classList.toggle('active', btn.dataset.toggleLang === lang);
    });
  };

  const setupLeadForm = () => {
    const form = document.getElementById('leadIntakeForm');
    const status = document.getElementById('leadFormStatus');
    const submitBtn = document.getElementById('leadSubmitBtn');
    if (!form || !status || !submitBtn) return;

    form.addEventListener('submit', async (event) => {
      event.preventDefault();
      const lang = getCurrentLang();
      status.classList.remove('error');
      status.textContent = messages[lang].sending;
      submitBtn.disabled = true;

      const formData = new FormData(form);
      const payload = Object.fromEntries(formData.entries());
      payload.submittedAt = new Date().toISOString();
      payload.language = lang;
      payload.source = 'korp-ai-automation-site-prototype';

      try {
        const response = await fetch('/api/lead', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(payload)
        });

        if (!response.ok) throw new Error('Request failed');
        form.reset();
        status.textContent = messages[lang].success;
      } catch (error) {
        status.classList.add('error');
        status.textContent = messages[lang].error;
      } finally {
        submitBtn.disabled = false;
      }
    });
  };

  const setupReveal = () => {
    const targets = document.querySelectorAll('.mobile-compact-card');
    if (!targets.length) return;
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add('reveal-up', 'is-visible');
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.12 });

    targets.forEach((el) => {
      el.classList.add('reveal-up');
      observer.observe(el);
    });
  };

  window.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('[data-toggle-lang]').forEach((btn) => {
      btn.addEventListener('click', () => setLang(btn.dataset.toggleLang));
      btn.classList.toggle('active', btn.dataset.toggleLang === initial);
    });

    const year = document.getElementById('year');
    if (year) year.textContent = new Date().getFullYear();

    setupLeadForm();
    setupReveal();
  });
})();
