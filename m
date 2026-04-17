Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE83280325
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 02:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776393529; cv=none; b=Tq6Z2OCeOyqWS7vpxMGW6x5mQfL0/IMIxxo72F2yHPBMJvZbkxUj7IzE6XxvvCRfTeD0agzk4RGO5T+mrCmtttTx7vQifGZSZa4D6NobEQunpdQs1byAXlWdrnF5pMtJPt9tomkarVOu4CWkF9mQsfrNOdS4fNE6ZyqGBpRVov0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776393529; c=relaxed/simple;
	bh=6tqFnhwFGh+OLvApSQTSx2YTuhHN2dx6RNhHwFsYoSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgHztW9Sr2iYFo2fUDSRZJV04EWTdHpKl1/i+qx4AZMrlxnwewr0hEWEyEZKxl2edPn3tAYCcCBnWL72e8DQwXRTJY9lKOq/yZV3N+HHkj/yAjxrAYaDC1N5SQ9Dcz7I9ciJvHIZc7GOn3sIg5YZi7zsYQD+q+IxJs5kJIsq+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aYkgl6gk; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aYkgl6gk"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8f9568e074so39019366b.0
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 19:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776393523; x=1776998323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WakxEdRsodWxaOFMphLhoIZqY29N4gVBZoVqp2ZkCu8=;
        b=aYkgl6gkqQ0QLu9PV82hJtxbU7oHb5Ai6C/DxQV6v9DRt3tYEvO1jJPApfLwGwaxFn
         Bv+Cy22MDkVsBS3cF/colfVHbUJ//ixKqkvvlHRjAsQM75XB1ZlmwvGKUt1YFA4/1IAh
         f3WO9o7qA74d6bKPx72cz7/OvEZ/L4jH79G1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776393523; x=1776998323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WakxEdRsodWxaOFMphLhoIZqY29N4gVBZoVqp2ZkCu8=;
        b=JeRooDcMhR6vfRFuloCERHNQ8KzhQ446LKpTlV4pNwx9NT7AGRzgOXDK9Z8cG99vA5
         BeeHlqV+pJ/Dsx6Vj2SCH2zhJX6meFDnpCxs+vASsAdU9NpMfQcTomrPivdJyjgsfpKm
         w761xgXtuWx9LuqltLQUfe9qZ/Ci6LczETlc0ZAWsBP8I3HhVNQkI0Og//0fIqWan6ZH
         q43u2Uj8ocdOxNE+DQpd08ENye/XJc6BnieE8oNiS/QG1LZFqoK36vdgM4qFjNBKeKis
         gKkV63m3/bZ5B95I/0gNFvO1QNS3BYJonAIzHn7uLR52sqvfwqlfhRKVP3F79GOEACYm
         u88g==
X-Forwarded-Encrypted: i=1; AFNElJ9dzAGlbYuPZjk5GLYA9ivdCyXYhdQUqii3NXEpQ8zFAvSORbe89mZ2Ufi95zsuOIEQyarsXFQnE2+XDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFzwvMEBQ6kcZ/4ieVzYBfYyV5SEoUZh4RMBHYVM/DCU739h2H
	0227qL3rTGeqChwOtMlxeF2eUAOFIcOcA9R6cpHdo9xkQulyLfSd3ts5iShjZGoST3UDywKg+yh
	L/Z3a4A==
X-Gm-Gg: AeBDieskb1nYLg6yUXSznb9RgRsee8c4bxesGrTKbB0ctbpHLCYgMWw50xcb0GrorhJ
	sfyY5lZsT6nF5KPYsNcR1xR8l0UnRwDyuykh3GlNygrxOGdY5sdb7hjMtvL5BR/hMloPnrsQVtf
	Ttza7lAe7d7fOlI9zIBPmG4AnITS8wv8XqlwcGu9HPNLkNwrjlsW/dj3BUesRBvKbJQrn4H1Y/Y
	3b2Z4AMI4N+FMpfHdyfNJEOByDdCuRGXJPWRxpwPob370W30nVnOT2RG5so5Q/7WyN0b1UPK9We
	3fNR+YeOC416l1RVpVaqVhBhS2C2EoYjg6p64SnZdXpPQS1nKOwvX1FS23tSkNigqp0IeDbDfus
	9QEHMlySU4Usp+l17Jjp5WsPCvgqmAThOQ3XV5zIbZaJxKnqVxp72HCrxhA9Jjg+tlbk8VtLlf7
	FcOJZE2uiicJpc6AcACySvP2lqH+HfVkDfl08Sw8/GFe9lSSIdPcQtbnEjGoGf/+Zy+Xzb4n47
X-Received: by 2002:a17:907:a646:b0:ba2:7377:6a33 with SMTP id a640c23a62f3a-ba419170369mr45160266b.16.1776393522835;
        Thu, 16 Apr 2026 19:38:42 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4555398f8sm7198066b.59.2026.04.16.19.38.41
        for <phone-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 19:38:41 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so919835e9.3
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 19:38:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Cqzk2DfNkNHn5tg0E1av92UIDgbvxMcmUqJHTBhUvZ42/UERLYlMY+N6couxsOdyaEg/p2pLRu3sFvQ==@vger.kernel.org
X-Received: by 2002:a05:6000:2508:b0:43d:71f4:7ecf with SMTP id
 ffacd0b85a97d-43fe3e1131cmr1197477f8f.38.1776393520334; Thu, 16 Apr 2026
 19:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-axolotl-display-v1-1-7abb2d248355@ixit.cz>
In-Reply-To: <20260415-axolotl-display-v1-1-7abb2d248355@ixit.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 Apr 2026 19:38:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W7LHNZGi9FU5dSj+OhbbfbVgZKwNh-Z4NKwi8CKsJkJA@mail.gmail.com>
X-Gm-Features: AQROBzDQabMFgLfZ9QgL6R4C4dIPXwo8GVWOgP73sg6lx2nRlWkT-3IW8H8ju2A
Message-ID: <CAD=FV=W7LHNZGi9FU5dSj+OhbbfbVgZKwNh-Z4NKwi8CKsJkJA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: visionox-rm69299: Make use of prepare_prev_first
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 15, 2026 at 2:30=E2=80=AFPM David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:
>
> From: Guido G=C3=BCnther <agx@sigxcpu.org>
>
> The DSI link must be powered up to let panel driver to talk to the panel
> during prepare() callback execution. Set the prepare_prev_first flag to
> guarantee this.
>
> Fixes: 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI h=
osts at modeset")
> Signed-off-by: Guido G=C3=BCnther <agx@sigxcpu.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu=
/drm/panel/panel-visionox-rm69299.c
> index e5e688cf98fdc..0e33454650d13 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -387,6 +387,7 @@ static int visionox_rm69299_probe(struct mipi_dsi_dev=
ice *dsi)
>         dsi->format =3D MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
>                           MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +       ctx->panel.prepare_prev_first =3D true;

Although it probably doesn't matter tons in practice, it seems like it
would be good form to set this _before_ you call drm_panel_add(). Is
there a reason you didn't do that?

-Doug
