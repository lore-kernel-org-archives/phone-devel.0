Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B971121C9F9
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 05:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740549558; cv=none; b=efLh8OdOJmRXA+q92aR6VGWICraFDWlCoetrbW4Rlk8w7OSWWlvPDer5b1dYs5pvweMTg8WVPHJ6PxqgHCI101qsIsUHTWgM6GN/zFtd8NyGIGFvbBVQ0A56K9wIReF2bFMZi1t6t2gZGGkYr4M2ijSlYHRxPOEJZCE+ra80VKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740549558; c=relaxed/simple;
	bh=20uJLoHJH8tsE+6AfrND96SpyUccdeO85E8ywgrZKF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpXdsUztS3y1bA4UTKKV2gjiOyYAWuEaatAzoRdxikZTNMl4PuFb2Aw1GRDIYWQi5A0jwx+EsdwMJkIyhuHYPNngnzdev1/tr3bfkp3bJhW+5NUsvun6QYh62gJfEFnVHxpUTM93EG35FLpIckZYqA3wcSZlyot8aasG13i+zis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=he5iouPD; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="he5iouPD"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5462ea9691cso7118894e87.2
        for <phone-devel@vger.kernel.org>; Tue, 25 Feb 2025 21:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740549554; x=1741154354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eMzggIt5lpYzzVkzOTc1TnN8z6VsZzZu0ORTornTWUU=;
        b=he5iouPD7D3qYSZ8109SS5Gq3/lc3sUys2g+VezqM+MlY6qIn2ew55Nh2ytLa1Rhn6
         LaS7PaT1vZ/KAJw98Vtm0sakwWw/60NkI+7TnH8qW3Xw+L6UQa+ScwGQkNcHflsyvPUe
         Wa3+TpATZCPikwT+SLubd5odHYMs+kGlj53yq1k1nyJuCBx0H/SvvpaLYk7Nb3hBurHo
         5ovA23D2CmmiPEWP8QpsOAwbe3zfmztYAYaZQqiSqUbu/HwOHtlfh7Z5H5BEM+BWKVR3
         xeWqMuvCqMEGiZQ22VnX4VOXMZBZI2DuEcirRJHNLOU8LdxO0q/m9gbx+TdZsCv8XWCb
         qXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740549554; x=1741154354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMzggIt5lpYzzVkzOTc1TnN8z6VsZzZu0ORTornTWUU=;
        b=HPlE+/YIPSo8MmK2dzNY0Cs9hzUEhGEzBQU/xDekPfOsXfVWw1/UbBP3copyH9sZ1l
         xOgDzS2bmXwbH63QEnJQN6vkJ9damkURnmgYVqaF4AeksuUlq37/D5FDH5zc0UBfbG22
         EAPHGLBwXK7mR+lbE9xCAI0w32DHMtWMH2ZvFPlNuqvUyyzWa1/GHjwTO7edxw5HoBRC
         1mEcahI9eh6aFuoB1qkV/+fxW2xHYJ1Wzti1zAFEHe8h73ZvaFj/T65s2QrNRw4j5Kk4
         HYxr40dGOWH6Z+XXSK22JkjCfx2M2u0tKQ4kniZbF7BGZWC9snCkIhMNYn9lXjVPVx4q
         LSQw==
X-Forwarded-Encrypted: i=1; AJvYcCVfxuvz0/BGCupo7Mv++SP7oVBL0T7axcoWFP4S4gSRr1lk62/Kq82rso6UnI/t5kwO3ypuS6ghdHepNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyp3HaHHWSR4Qh4cUf14NM4t3s8lYxmY/hLSXu09Dq/2yKvT+U
	FR5xTEASTBGyB6pekj2US5gHRPNiTVLAENUb7hUVFy7gzQrLUTpOKywRmK2XZcQ=
X-Gm-Gg: ASbGncumN8E41yV3N9yTq/cOauSPfn2JexltxzmmlGrdIwf0cZATgLA3CM60kQZcEcx
	tF+m3U+vG9TEPlndOs8D+FrmNHyqKziW63m5QKjmK1ef0CK3d0E4xoCqFcUtBiaL8jsfmGIYWee
	hoJToQlQFVOPVx8woDfkDfoietMBp+LikyztwuA7eaxruKbJaHXa61yYGzxJFO4JytOS4ELJAmq
	YWAtYApcxPaw0/qc/PWA8EESz3omwT9liIK45yYUtIa0fy/O+cyaaM2f0YSSkEkHo786UTUW1s7
	EB+cLfS3zIIaDdst15KiGAMeiPIaWEOpiOD/O+evuz4xGS0eQLnnWn6AiCX10H1L7S6sFU+n2FE
	xymJkZQ==
X-Google-Smtp-Source: AGHT+IEoS4qwP4ua72xrTF0W1n0ce2ri8eECexu7dt46ZDMlqiICPAa9TU2+args7SmvRiq5CJK7wA==
X-Received: by 2002:a05:6512:3f05:b0:545:646:7519 with SMTP id 2adb3069b0e04-5493c39db7cmr2155507e87.0.1740549553775;
        Tue, 25 Feb 2025 21:59:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f4d50sm346333e87.176.2025.02.25.21.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 21:59:12 -0800 (PST)
Date: Wed, 26 Feb 2025 07:59:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/panel: Add driver for DJN HX83112B LCD panel
Message-ID: <xnbncjxfpc3cideza5cemnhskdpedqpiatmvxj3eu3xgtrv24n@iky5ghkh4grs>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
 <20250225-fp3-display-v2-3-0b1f05915fae@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-fp3-display-v2-3-0b1f05915fae@lucaweiss.eu>

On Tue, Feb 25, 2025 at 10:14:31PM +0100, Luca Weiss wrote:
> Add support for the 2160x1080 LCD panel from DJN (98-03057-6598B-I)
> bundled with a HX83112B driver IC, as found on the Fairphone 3
> smartphone.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/gpu/drm/panel/Kconfig                |  10 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-himax-hx83112b.c | 430 +++++++++++++++++++++++++++
>  3 files changed, 441 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
