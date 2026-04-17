Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889AB390207
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 14:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435069; cv=none; b=VdvYKPt5YefRSb4sK+U/WhcUp11lS1pBs2gyf7l6QDG8dTogJZYHfqvRnE97UFcknm5G7m/nL8OVEWEsSo/5SjiHkF6UYQXJIyLasKwQpE8Yuvidt3XcypMAgmwcD1vraFya7e6wKqzJmMsRe1atbRy7OiMLQZTivjCVRN4In2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435069; c=relaxed/simple;
	bh=uQJ2FMAub5BVKbTEbZ93FnbwcXD4SVIlX/Mpiriodpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+ZBio7Vt2iUbtm6cKKv+aApYiMO3hZr53zJ/1ZI1ETK+pEf8FWXHBDtMwDzsX0JFFyP5ilc868jkAoU2S4vuc06D3t6bobmuDEMMjUolhtuGVMU3Eqeb4unSEOHT2SGL8XgcWXdWxEnuyt3pBhQgUICWKSgm0Drra8lUh/YIgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RoqpLBxZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RoqpLBxZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-671ff4b716cso1199774a12.1
        for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776435062; x=1777039862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBLkOis/Y7wc9LIqTxf9OXJ2CK9Ur406B2g2hN+Oxg8=;
        b=RoqpLBxZRN3UjC3u8YrnjjeAom1oCvG/VLRrsLYv34Ha+r8n04RVJd+bERxvy52GDV
         8r+6NOxurPQyG7ewVkmW6avbb/qwppjT9OR1uT11FZQ78a3UUwowLpH7ptrjFHbA9vIm
         jjKmOJC7kcYdsAy+BUQHzsLkNKORMCB9t1dJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776435062; x=1777039862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TBLkOis/Y7wc9LIqTxf9OXJ2CK9Ur406B2g2hN+Oxg8=;
        b=QljJNOcPeDZCgc7HdSAUmKEb8WjNJwZhzKLeWiYqqkRM6TS5AdmYxsDj7zeq7uJPip
         IRU1avUnIdCifpOKQa8YW7SBaNqojMpk4ArrsE1huNYusYqDHwTg0EkF8tIhd1zrmqLo
         mxxSyf22OuSiO5g1cpy7tmUrcrmJa+IG9UM2lBGTN5cmYm2fKdeYEWtRv/NQmKLQgUb6
         Xoi9pcMfjGLhimXBjV3ZYWhr3U0oOAWVI3spQzeKhZGEVSayDUAnM+UXNsl9CIN6uSiB
         v4atNeOcAD/grR3dzNHS6TAYuonvzPjsD41pAXH/YHuvlhTXtVtF7jAq8pNm/unMJJYB
         WzgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1EuaadnzD1Tgtfxvb6YV/rjk6E1eH7YE05dqjBc0zUCe3RK6CWNOjwJzR9WdssK5M/tRVoYQ9mZOJyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwArHhhmThvG8l7M4wgZSgm659kIjDeS3UhQNt2XlhYk/DtOaAF
	RDkTL3Qi6ZqPtIVI35l8qmRV1D9tRyC895wtlh5WFGLfJTz4SqtGOe9qC1ImZ+ZCRfbn/IJWfa1
	oWjlGrA==
X-Gm-Gg: AeBDievu+6EqwCxFHWm+0rJscDHRrGdfWqP7ndFPCiaD9KmTMFfE4rUtX8fWvtbMxaf
	AiEdQBo5jBCPqxxfZickkOa6CNlBBU50cVj33Q+6uUOeXLR6S2HJ3u92vwmH6ncgwUQU1P5CfjM
	V9SvWyJRboSkqy5QfTcGuzFDH4G9yvKkHZuX0OC8bzarSYmMyXT4G+yWQYMi2/Bd1ZQR2QWOhPe
	LIwz2w1OzbhDWYvex+5V4/Iv0RLdQfyjJAM8jRCzPayL02aAS/DTS1F/kayxXAQAwom/gs8WXZE
	RAhTv48KLKaJbjt+GGhpm86kM8+XGwXSQBKbH8ipQiOJDeFw1WirbKTek5LefPpEbEcO+/v7VI2
	ITzYKilxNUaahl4s2NM9MMGFJXCc1ss5Vpk4z/4o7wOrBEB4FdIMwyMND2puaRsg3Lx1l/VdUDZ
	PpsUKWrN8/40ZXjk7WJ1Hdi0wD6+pGNKeU321CSx2O+inA5kMwY4LeTubGg8PPlNPWYKvpPN6z
X-Received: by 2002:a17:907:9816:b0:ba5:1fd5:4947 with SMTP id a640c23a62f3a-ba51fd549d3mr3828766b.27.1776435061515;
        Fri, 17 Apr 2026 07:11:01 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d50922sm375704a12.21.2026.04.17.07.10.58
        for <phone-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 07:11:00 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso384998f8f.2
        for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 07:10:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9l/SUmu1j9eqVuizyKUeI7Y9/XaLiHz/80ycbOg8l6jHaAA8X3iKQvQele73FCQJiMkLm+w+glw/CUZw==@vger.kernel.org
X-Received: by 2002:a05:6000:610:b0:43d:7a97:78c0 with SMTP id
 ffacd0b85a97d-43fe3e0c65dmr4484672f8f.36.1776435057986; Fri, 17 Apr 2026
 07:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417-axolotl-display-v2-1-8ce5341e46c2@ixit.cz>
In-Reply-To: <20260417-axolotl-display-v2-1-8ce5341e46c2@ixit.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Apr 2026 07:10:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdBFYuy353bcZdSFe=Jqdo8KEMpX7hnHFSvEDku=3ODQ@mail.gmail.com>
X-Gm-Features: AQROBzBL3aZ9sXCrwGMOK6DC1jFNqVtfqGIpTdfYDI67LSvB3V2OJLIsqYzGWsI
Message-ID: <CAD=FV=XdBFYuy353bcZdSFe=Jqdo8KEMpX7hnHFSvEDku=3ODQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: visionox-rm69299: Make use of prepare_prev_first
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

On Thu, Apr 16, 2026 at 11:55=E2=80=AFPM David Heidelberg via B4 Relay
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
> Changes in v2:
> - Move the prepare_prev_first before drm_panel_add(). (Douglas)
> - Link to v1: https://lore.kernel.org/r/20260415-axolotl-display-v1-1-7ab=
b2d248355@ixit.cz
> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-fixes:

[1/1] drm/panel: visionox-rm69299: Make use of prepare_prev_first
      commit: 4a92ef0c57df610ba0b2eb7f308c5472020ce8ea
