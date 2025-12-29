Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749563A1E63
	for <phone-devel@vger.kernel.org>; Mon, 29 Dec 2025 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008981; cv=none; b=r4e4h5Igyms2Xcdt6j6/QAAJMvWhO71myCYBTqRK56FPvWrZuZzaze54CyZ8xUjmign9qkJ4bxcScQNhBfCujzr44QdwBeNFUkKhV6VB7rIMJ6ohyHNxt9yM/C27mkxJ9qn/+K9+EhUn7PqzCx9x/5Vsfj17jB8xcacaY2XSpjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008981; c=relaxed/simple;
	bh=ElIl/LwUxT+7Qz5WQEOd7005dWras+aU4kCXpszazF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mkMuAOuVyaMy/VkT/slSGDb/Da2BE4QLuRssDEn3sQRTVD4ZZZzTBk3UM2zvptlVgkhqz3CTggYIO67deRAWarG0T3qFV3V+bL++eeJgTZAdlYHkaRUADXD6uGW9c5sllFbdQoIskChkMii4bUHRCkwlhAbg2VcpVOXZnrSGNEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vNiMop7Q; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNiMop7Q"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5945510fd7aso7275434e87.0
        for <phone-devel@vger.kernel.org>; Mon, 29 Dec 2025 03:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767008978; x=1767613778; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ah+1J5fysuvs0h4L27yS8NPBtXSkLtzi6zVw7H+0pPc=;
        b=vNiMop7QmVbcQFdrHcpEsw4gogLX47xCONNCuSsTYQ5YfolrKx/DIknWHH+k+hCXGV
         WkpNXLerDXdEpz6g/xjsqKsmmoRqCXYikPhk/4c39kTK12OOiUp0upJjbaQSBqTVarYy
         Ms5uG+ft/FMFfLHoedW5TWriB2stqgcLoK8HZiTwF8gWgrtiEeW7UO9R/UC7+8C+at0Z
         F44mmMvDIykwfL4WaE6aw5l1UoPIUj9GDmE00amtUvLkreakd+klD9MAL0+gmObS+L/7
         wNe2HfTTLBlTlk7YwCK3BY8KSjUJDf8R98oS0NykbVGV+MwYSCQADtoVPa66hBLecpQJ
         +vtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008978; x=1767613778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah+1J5fysuvs0h4L27yS8NPBtXSkLtzi6zVw7H+0pPc=;
        b=fTWp2OleukiOABlaIojtHTxuskz6c1tUOJiZ5mLJGfi99g4KvOUnDNHl5RPZM58X4/
         WVajl3hLPA6k22ALeM78eFf2uQ0qpDk3LPGaVNgWHsWF0SUgwmgD/MZHp7YNPW9yF0sT
         p5h4YtmIT4fG7yu/08UzpjCvLnRaZvKj8pfUQI9QZIidqms8Bb+9EgTx/cFsnY67Fqt9
         t/5xRu2Zl8Ehwjk9sspFG6POZ5DaZ/mHrhHCwIOeNTS8DXm6CsYMk45u7cnP4S3A4wUL
         ol00kWGfMLMmNUaSebjQq+5WDgght6PbcHRdmWL712cUNEdV8bafzHoJLoVeKc7fe9mW
         yt3w==
X-Forwarded-Encrypted: i=1; AJvYcCWhL8wOo6yqJ6YOJUCmZpSfsE4Jx/CMmK4Vf+I6nDZ1oX8ZgjlOlUOwpEui7f9E5QSZjtFaXC/v/PYtQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJTXXwyNXwANAkq/lXuemRXr4nV0wlhluum9EwSdSN2gFwOZB8
	1bIWD5vasoxqAGzDaD8/MHQLuEFESNKnQiP67VB8z2Ettz0Uy+nSSyhjV/+L9QE8L5pi5+Y/4Xa
	terbhTI+UxFFmdpGb32AJwNpwjhXRwuECS5snQwGhbA==
X-Gm-Gg: AY/fxX4nInuevV145+VXZ0fcwyKWwdBpdGwTQPOWOx6ocIiwRTOhb8QsBiTaefHTD2a
	Z4rs5+Pow3Fd5QHVM29dsm3MNeXB8affYVqA7JQc+Uf93s7w+JYDPybY9D4m3C3GCtKx/YW6D+B
	ipQgmNV5WDG8aR8h7s2dq7MMFyrEORgLbREb2eL2D6i9vHwB0SdiwU0I0LfiXsrFvsBmDTXFgAr
	DrG2HNLxOuP0f1rrrOYvh3VaOIRnMMk0rmslK3C4nFAzitq8fv3KP4MEBwt4BsOBeh3XT6o
X-Google-Smtp-Source: AGHT+IFd7uULZsU6HqhtyBuw4OeaEHVzFMIlWbNNIkG6PE0mDPVdhJ8EzFPp7O0VhFMojnvcMZr8G9gMv1f1D/mxiUw=
X-Received: by 2002:a05:6512:23a7:b0:59a:107a:45a9 with SMTP id
 2adb3069b0e04-59a17df40a5mr10605277e87.52.1767008977494; Mon, 29 Dec 2025
 03:49:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213084843.7491-1-balejk@matfyz.cz> <20251213084843.7491-2-balejk@matfyz.cz>
In-Reply-To: <20251213084843.7491-2-balejk@matfyz.cz>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Dec 2025 12:49:01 +0100
X-Gm-Features: AQt7F2qxwPUA9qoW_RwC445aI_amGPo8zYmXnkjw9vaaoTtrHO_3M12iwbGDMxg
Message-ID: <CAPDyKFrX45baw9ezWebF=sNHpaNtJYfvdTkghZYRWi2RfdGN_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: add audio power island for Marvell
 PXA1908 SoC
To: Karel Balej <balejk@matfyz.cz>
Cc: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Dec 2025 at 09:49, Karel Balej <balejk@matfyz.cz> wrote:
>
> Define power domain which needs to be enabled in order for audio to work
> on the PXA1908-based samsung,coreprimevelte smartphone. In the
> downstream code, this power-on method is marked as specific to the ULCx
> series which is allegedly a codename of sorts with ULC1 corresponding to
> the PXA1908.
>
> No other audio components needed for sound to work on this phone are
> currently available mainline but some successful testing was performed
> with the vendor variants of the respective drivers and with the domain
> forced always-on.
>
> Signed-off-by: Karel Balej <balejk@matfyz.cz>

Both patches applied for next, thanks!

Kind regards
Uffe


> ---
>
> Notes:
>     v2:
>     - APMU_AUD_CLK -> APMU_AUDIO_CLK and group it with other register
>       definitions. (Duje)
>     - Move default function exit path inside the switch. (Duje)
>     - Modify the commit message with information provided by Duje (thanks!).
>
>  .../marvell/pxa1908-power-controller.c        | 39 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/marvell/pxa1908-power-controller.c b/drivers/pmdomain/marvell/pxa1908-power-controller.c
> index ff5e6e82d3f8..543e8d33ac0c 100644
> --- a/drivers/pmdomain/marvell/pxa1908-power-controller.c
> +++ b/drivers/pmdomain/marvell/pxa1908-power-controller.c
> @@ -24,12 +24,15 @@
>  #define APMU_DEBUG             0x88
>  #define DSI_PHY_DVM_MASK       BIT(31)
>
> +#define APMU_AUDIO_CLK         0x80
> +#define AUDIO_ULCX_ENABLE      0x0d
> +
>  #define POWER_ON_LATENCY_US    300
>  #define POWER_OFF_LATENCY_US   20
>  #define POWER_POLL_TIMEOUT_US  (25 * USEC_PER_MSEC)
>  #define POWER_POLL_SLEEP_US    6
>
> -#define NR_DOMAINS     5
> +#define NR_DOMAINS     6
>
>  #define to_pxa1908_pd(_genpd) container_of(_genpd, struct pxa1908_pd, genpd)
>
> @@ -59,9 +62,14 @@ static inline bool pxa1908_pd_is_on(struct pxa1908_pd *pd)
>  {
>         struct pxa1908_pd_ctrl *ctrl = pd->ctrl;
>
> -       return pd->data.id != PXA1908_POWER_DOMAIN_DSI
> -               ? regmap_test_bits(ctrl->base, APMU_PWR_STATUS_REG, pd->data.pwr_state)
> -               : regmap_test_bits(ctrl->base, APMU_DEBUG, DSI_PHY_DVM_MASK);
> +       switch (pd->data.id) {
> +       case PXA1908_POWER_DOMAIN_AUDIO:
> +               return regmap_test_bits(ctrl->base, APMU_AUDIO_CLK, AUDIO_ULCX_ENABLE);
> +       case PXA1908_POWER_DOMAIN_DSI:
> +               return regmap_test_bits(ctrl->base, APMU_DEBUG, DSI_PHY_DVM_MASK);
> +       default:
> +               return regmap_test_bits(ctrl->base, APMU_PWR_STATUS_REG, pd->data.pwr_state);
> +       }
>  }
>
>  static int pxa1908_pd_power_on(struct generic_pm_domain *genpd)
> @@ -123,6 +131,22 @@ static inline int pxa1908_dsi_power_off(struct generic_pm_domain *genpd)
>         return regmap_clear_bits(ctrl->base, APMU_DEBUG, DSI_PHY_DVM_MASK);
>  }
>
> +static inline int pxa1908_audio_power_on(struct generic_pm_domain *genpd)
> +{
> +       struct pxa1908_pd *pd = to_pxa1908_pd(genpd);
> +       struct pxa1908_pd_ctrl *ctrl = pd->ctrl;
> +
> +       return regmap_set_bits(ctrl->base, APMU_AUDIO_CLK, AUDIO_ULCX_ENABLE);
> +}
> +
> +static inline int pxa1908_audio_power_off(struct generic_pm_domain *genpd)
> +{
> +       struct pxa1908_pd *pd = to_pxa1908_pd(genpd);
> +       struct pxa1908_pd_ctrl *ctrl = pd->ctrl;
> +
> +       return regmap_clear_bits(ctrl->base, APMU_AUDIO_CLK, AUDIO_ULCX_ENABLE);
> +}
> +
>  #define DOMAIN(_id, _name, ctrl, mode, state) \
>         [_id] = { \
>                 .data = { \
> @@ -159,6 +183,13 @@ static struct pxa1908_pd domains[NR_DOMAINS] = {
>                         .keep_on = true,
>                 },
>         },
> +       [PXA1908_POWER_DOMAIN_AUDIO] = {
> +               .genpd = {
> +                       .name = "audio",
> +                       .power_on = pxa1908_audio_power_on,
> +                       .power_off = pxa1908_audio_power_off,
> +               },
> +       },
>  };
>
>  static void pxa1908_pd_remove(struct auxiliary_device *auxdev)
> --
> 2.51.2
>
