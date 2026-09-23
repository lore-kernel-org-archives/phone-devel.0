Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F66471258
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 22:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203877; cv=none; b=K62zTxQSIbFYMp3whUuqv8rdqlWLrNvVbW5svdigrDXcQieFMssA29Xe0Y7GXnPGpsCOmlaNd5IVLcWdmtRBOm7awNAZlk1CZkuD2s1K0qGPzIFoiLtN7nmlXIJT+LQuXcKSsP4YVAR8cP9+xrV51GolAuqdvcu44OCjrKuyQWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203877; c=relaxed/simple;
	bh=EKX35ie9/USsn0Lh1pIBDFxv7amLEruPOvFxMnWeGnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IDzDrJEQ7Uto7n0UsSpzDkPrXtXU/s9SMgtGhlIC/pHEKrQM0Qy6ZhHJKQ75wwYY1U0QkO8N2ursgaDq+tA895iWlYm5ExvTczsdxpGuzrKbitRTRReDqkj4899QdAOp7fYDERrF3vEDgzCpixfhKcUlL9PjAVpUBDkKIk20Ups=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7P36F21; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7P36F21"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48442ea8f59so169739f8f.1
        for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 15:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203874; x=1790808674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mI1/ZYE5YHBF2sXaFTZzYUzCnN//3DiBm/zH9LcBkPw=;
        b=q7P36F21o8SR9xcYCLCdLlzodnr/WLXRH3eQy77uiPD1la8KmWVLJpczwS36SDjxz3
         WjqMrm3e5Tq+zY7m8dB92immHr+Y52qat2rwiCO5ILWnABEd9eWCZoDfaIe4omahsXu4
         OEyRfurBc01MmD7qj7GxH4PDciCVoXOM+L4Ul1Ayod71ZYCiz6wLApQqHtMG3ZaJjRsy
         On+ey/i6RvKmYhd7sNIR3gHrKWi88u5i9NTXBmjtsx3q/2V8X7LeBOvXkvR+zFk3PZul
         maCDCs6yQjo8ZPVFJSFmwZ0D4DF5MM9/Tk0ICrQ4FRxa3Rmb6tI7fNeXlBgD+S7xnZVJ
         BEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203874; x=1790808674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mI1/ZYE5YHBF2sXaFTZzYUzCnN//3DiBm/zH9LcBkPw=;
        b=05zb1OsgLaEXizrh02exuk4oEsgkMnnV82AWxr2/q6yM3fw1dIe+hCOf7aKS0nb6W7
         irm84mMbOzIwZSanwqgVSRUI6HGPlFaMCXGruxJvrsdr9Wsa+kboofjg1XT5DD/iWDbC
         y8Bt3k55wUTUP9E6BMGrZjCrpecLm+6/JQvTyp7y/RaEQXvxCUmhX7kk2mbKv7yPVWI3
         2pZDh0MtGs0J9xQ8eZPiHTqOAXoohAlhXVuAc0/qOPubrMSVLuXda8FuIxHAWcrgCHe3
         lQIrZt77VleuOk+iLBETs10twJ8Moc+GjYdkimxZSYK69Gt1g19sF3eQ1uvAdABqvuMk
         nB9g==
X-Forwarded-Encrypted: i=1; AKwUvBxBN2W9RM6pMqZUpI57sUovtl9SLkBAT8ixIeVCea6SvL247yabXNoaOlZIL2fyvM1hiyigGsSmtj0KdA==@vger.kernel.org
X-Gm-Message-State: AFuF++lPULyhq/fwqx9JuX+ibfcYQMwdB1MyFxkE0jkqoKlRIfLGK6QW
	a4RDgLpL5KGxlmwTbefE+aJ7RRB1TPr/XzEXdnyNieb8Tv29sgMxPnCH
X-Gm-Gg: AYBFou1TntRptm/4v/747NSKfRQIgjurPeClgRRJd0uSCE97NajlLJTb8Ti8CLu01hw
	lAE/Yl8fe3mW4jKtgAAPzctOElXeuxGZP0E5qpft+hL9sBVX3S+T1XqvmwBqB3TNYyNf18JqSZQ
	Eixoy1cIpglGPdnUKTcEAh+LOOMvfcLWIw9BtfwRYjWgAlrP88ewX+VvSVFo2I1qjwUgGSYCBm1
	YOk0MFNwJ+vnG883pLEhq49yolaOGdLzWOvFfqRP9DKMLtZnS5oFyyBx2CkntkTDc7ybgb/hDy9
	f7Az0jW83UWLYua74emw38p7aSFPWZQ/khMe1/QnXsiN5mgMLsMI6ycUM8RYeCZ+/Gu4d9PChn6
	Vpm40GOWgtpeDlHJuRZxRK+th4RLbQTsmPOJUxUmH0CcHwkzAM+kkSnjg0euzRe0fS7VGXLa5n8
	vKKxDy8LAawfXg+GSYaCuuSnyuPpO7FmyCjFtVwOzqkxna8VdRLWo0XTpEMJdF3Z+gOiJ9Xu3bo
	xyW6rDfgDRnUNjP4WLnoLCnbkJwwwRxHA==
X-Received: by 2002:a05:600d:8642:10b0:49f:c305:f4ce with SMTP id 5b1f17b1804b1-49fe6705708mr6898435e9.16.1790203873928;
        Wed, 23 Sep 2026 15:51:13 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm9822109f8f.2.2026.09.23.15.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:51:12 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: devnull+david.ixit.cz@kernel.org
Cc: abelvesa@kernel.org,
	airlied@gmail.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dsankouski@gmail.com,
	jesszhan0024@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH 04/11] drm/panel: s6e3ha8: Introduce AMB577PX01 panel
Date: Thu, 24 Sep 2026 00:51:07 +0200
Message-ID: <20260923225107.191388-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920-crosshatch-panel-v1-4-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-4-de6e9512da96@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

...
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
...
>  static const struct of_device_id s6e3ha8_amb577px01_wqhd_of_match[] = {
> -	{ .compatible = "samsung,s6e3ha8" },
> +	{ .compatible = "samsung,s6e3ha8" }, /* deprecated */
> +	{ .compatible = "samsung,s6e3ha8-amb577px01" },

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
