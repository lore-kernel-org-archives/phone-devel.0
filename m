Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280B833B6E4
	for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880594; cv=none; b=Z6wEOQUrZEladQEIQPR4gyO34wFFhUqKMYKyelLfvE7AN7yE9X8G6J98CC6Qd2Rof2N9px2vUOCUYKeHrIFYuJRwBC2kMFWPMH6e2JsR4v2x1wM0Dl1BuTWsOj45wrWDIsmL/m2xP2iYXHgG/Tf/PWidosHBsZd1bnwB/wyr1P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880594; c=relaxed/simple;
	bh=GzXFDo5IY5tF/4y98oUYhUu76Y9hSnuKCvwUardhPFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LK7vNVu6+oWBX+9QGrV+3Q6TIgDPmAZ6qo0CBfcaKyErFr3Iuo+c0n572phHWypB3Vcecu3Zw0UjXDBS/frhl31b5OaSPHEYwMsoyg6S6NAnz3Cj/aBE9S80YN1YH7LQ9AL19JBG5qCaBqNIKIwVazUtxiJ5upAParCMIBDTAwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfC3ZT23; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfC3ZT23"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so1450233f8f.2
        for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 02:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765880591; x=1766485391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IZdqT3f5FjLJw92pQmwl5xRGES7bj8LR/OQmW30pQg=;
        b=nfC3ZT234EotRGpj+zunwZsWh8l0L++0Dgh16MXctiVYjPUGdPFYnKv3VvUfr4I4uc
         f/MrzrgsvgpMB83loFwvsWFtRj6BMpEFoLUFgGxBQYWB9gQEq+5AWQk1/V3sPUuz5irb
         ua/UpngCjjkrTjihHIP9jVkb8DxSGblVDZkgMIlP1A3y6UMsh1g7WMfOhMWJHK3CUPWW
         SYWxmr9YdOs3/151YSCgNFPyhiI3cgtgKCcYEWBJ0RSZPCnBl/cHMR2UfWgOl3ixgXWL
         x1IIOoCxOB9Q2KJrTWvG1HO43nrFQmmebwq6DDpCpGi5B9rrP8iB0Yv71IhdBLl9gm/p
         Nz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765880591; x=1766485391;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4IZdqT3f5FjLJw92pQmwl5xRGES7bj8LR/OQmW30pQg=;
        b=vFxEjs0RgGq5ddqcmMJ7wUdJZuOKTX3SBdWE4QqWdXxnjHDQ9tKb7f0C3VJHs9DL39
         GsALTkK4o4jCW9t8Iml9OotONM6xZvIeiYaEyxyqIzZlTek2QXJ7OjQOBcbF2L51c3QY
         Jiwo19IpNcKLxaqooTu2Ddq3GklqT/l7sFLza5Y+upauS8YpvOJ0g6Ljy0RVYuXK6qYl
         9Kt76BVs2so7UvOsfjD0gYElqom/eDbjQB70lujqL2mQHNtEWZN2zAVBBtPBcM7nt1tH
         j0tVJvCoFOKzcFMga4slFNGxUHu2+0909c11lQhSbgOPhOXPqezjKryQFNK67rPT/Ufl
         79XQ==
X-Forwarded-Encrypted: i=1; AJvYcCW27dzlrtvFFg88p5uYAc6UmN6BpJD2kqrpKI4YZ28idFJrlkcEG5xHL/cXWHO3jO5MbvdxoA5oRpEv7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCfBOqOe8mSXIDYGavfmJYVGgXU3M/7HdGOg8fCSKoTS/tm1T0
	v1wgB01a+GzsIA1Imfj6CiYlkeBfs64iyoD1CbBzSQ7s7tsEJBEviLN2Uf2o/v7Cnks=
X-Gm-Gg: AY/fxX4pPMmXal81R/yAnqbR3Tu2u4yfbxrU7x6z/qFsEv+7vw3Mln2kQ3vrPKDyFWb
	X5zaDYSaEZ2XRz68jFD6Bkttfe1xf4X3EuLLNxQDdGsrPR+StiAQVUqPm40Mas9MTwMWqIVuIXw
	l/UdvAsIdLwwcX7JC3ABjKoElwYPeHRMnOCuv8beTshVaIAFDoip1iAob7yxTeGFG6QM1y18+oc
	mkCAT7UPEdBa04zQ1AnitseuJDHaECW7rJJOf5QJLYz3p2yASPJs/0ia5/h0B71wPpdfi0b/AJB
	xeotVOQn/91F3on+tucLnj6KYSSPE9rCurdGl39xiAr84gcS/FtseI8K0A4/8hgjSzEiufTB3mZ
	a1ef62CCjIz/IE/L8/kGwGJ/r2B/EpEMeiClu2Nq98UytH7wbiLzCFarMpziUc2xqh8jvxr1e5F
	eqL6kgiIMCEv1t10Xk1SUNO/4KgX/Pdzk=
X-Google-Smtp-Source: AGHT+IHdYoe0Jxs5on7xWo5sC0mu4jrv63ZGB+gV2yfNBNXsZdkj2vvC6F2crM2qJ3WTRAF/bSMiFw==
X-Received: by 2002:a05:6000:2909:b0:42b:3131:5437 with SMTP id ffacd0b85a97d-42fb46e1b5fmr12776263f8f.34.1765880591356;
        Tue, 16 Dec 2025 02:23:11 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f984a268sm14996292f8f.1.2025.12.16.02.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 02:23:10 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
Subject: Re: (subset) [PATCH v7 0/8] Add support for Pixel 3 and Pixel 3 XL
Message-Id: <176588059015.2230787.12554234444654203091.b4-ty@linaro.org>
Date: Tue, 16 Dec 2025 11:23:10 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Sun, 14 Dec 2025 15:51:16 +0100, David Heidelberg wrote:
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[2/8] dt-bindings: panel: sw43408: adjust to reflect the DDIC and panel used
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dbb5d6010c1ecf01560af405c5b503f4cf2b1149
[3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel compatible
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/be85d4124dbe6ed597c7a6a16e53d8b98684fab6
[4/8] drm/panel: sw43408: Separate reset sequence into own function
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5f0cc92fa0dab7cbb999dedc653f5857a62b2022
[5/8] drm/panel: sw43408: Remove manual invocation of unprepare at remove
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cbc1e99a9e0a6c8b22ddcbb40ca37457066f9493
[6/8] drm/panel: sw43408: Switch to devm_regulator_bulk_get_const
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ed2b818a24760d7adc92d2e9b0e135f2c33edd8c
[7/8] drm/panel: sw43408: Improve wording when reset-gpios aren't available
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/29e208a08a8ebb0f214e815eee0a7beff778864f

-- 
Neil

