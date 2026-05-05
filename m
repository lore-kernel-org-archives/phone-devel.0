Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBC335F189
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990228; cv=none; b=ao5WEuukJSRCdWMN4G2jR1zg6kn4XWpVN8RlF3sZ/MwB8djhoHhQqR6fLAhSocCoDNfEXG1lHg+JTNUhxcCKQUgKtEFPYVgdT+nR9IU23rKJ+iFfx3bSTZfyCFzsTw5qHbHwUBF6FIdU3t1gSPktMzjUhII3RYIqb+4AUAwvuNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990228; c=relaxed/simple;
	bh=aOj9u2K1+sVwu4Jp/FydY/0A4jOPgCv8qzJRBDBfuf4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a+OvGly0nzbTrLQsFcQZqeFK5iRIE9g9770F2rLhVh6BmH/h/twZgxzvwUD/iEPo4tjLI6VlwZtzxDi91Up/iyf1iboVxuFv80jpT2dznlD10alhpo21XwvlCWEfwJX1GMoWEdPXvPuewVWE9uT629APR6agi3ARc0QHczAXYyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oSuqMGDl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSuqMGDl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48d146705b4so12240505e9.3
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777990225; x=1778595025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6MZe1ybGVBCmTIv5/w6ZroHfedrBg8qQBo9KFDThLQ=;
        b=oSuqMGDlr8+FjV+D/AHUDJ+PE9MsrEHFtCfWXOaFTVa03+skcU2XMANeD26/Vz7Hlq
         R+YDEUO1HB9dTyXs1F3ruXRIyfj6D9iuWZsJ/tofQzEDzHzWhPiysv03fL2UP5oDyw7g
         8WBoclEYfKg07aL2r3DCuKrPq3XWrBrm5AtV0YoN9OaIuYfD6k3LpxIt3zlukCeI1LHk
         j1R8+z2yALAWSqzMAaO3wUs/NBpKKuBb9gkoxiI2sWkppoprwZi1F5xAZf1kyBG1iLoR
         KzNE7XKgIjUOT9JpqErmC2/DMP1YtmemK6IJ2Tkxn4iRGf0ghT4QQe1MZjQVibCRtjJv
         A0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990225; x=1778595025;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X6MZe1ybGVBCmTIv5/w6ZroHfedrBg8qQBo9KFDThLQ=;
        b=qAj00yqe0XmKDhxf7ueuoAXdCC7x05Ze3dKzB8HbP0ZNwSgP3vDdS5X89ilk6iz/XL
         rdm3KBZ6IXD+LTzqfoPe7aZ79qGJmjVSq88u5zGAckYd039q5ViN9vxcnqJAP0RKeyFO
         8b2oQRrx797ZIR67usRrpLMSZn4HGXa9BSbZgnOCXdmVbU4+o/csoUA8+p1Im+fCtkoG
         99s5GQHNsq/RtrFzsW3AFiyjr8FPYYLyQx7uXASYRk9dmKe9gZTKWBRUVnveYJiJVO37
         akkz+SLJKeGna2K7ryoyWmwehxQ1QXPRefFiIQ0QwC2r+147hljKtxJKknyp4ZQm6HJt
         wEjA==
X-Forwarded-Encrypted: i=1; AFNElJ+krfKb5YtLzosMsHmxYva27krKDnrJJlWPhEzr+NibgMI6ZxGsLT1aRb6xRT6HcmMA9iV/jcD75FuJBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1qrlm7HJL3UC+ViGMdcC9Ts7BT2K0+v6N9ROD3uxmZTfMAi3z
	hGpEcvu2hg1nXrm9f/mh9h4V6k6afuT2tglyGf1YnF4A+K/+FYtnf334dVCsV6DYtII=
X-Gm-Gg: AeBDietiZz/tMdS0CKmI5U1n3t6ycwSw6CUOUm70wcrLKvK7pgh7bxAZMhKfnXLDFaa
	U+AWAALOfGpXYqtSlmiKzVrsHq3605zvUjC0XY8dkCxkCYRu0lVbUIlJ3A93uG4Zl1zeSBoZw2x
	+RxzbIErQDRP3bEA5SMcs9w6570AEzPQbAf+/F4vw5Ry22JthgttMYhsnlry1slI6hBj4COQXdt
	wbgaC+LyCvh122KNltwqJe6x0wpbxTr3V/wR2VS+IMaFviaxhvjyVjcF0Bxo/Pced/unhL691gD
	dg0woWeXw5+sXmsbdJTOPnj0+ySciAhO6k7IUPvR8kVKSV/agLvu03M29xRRRv0JMZTxGxc/zzj
	vBDi8hiL7lo3Syuow1J7db1TBf+GK5RWkF7IwX7i97kcIvVQ/8aXcJAv3e/EoM9A7JNBKCFPmo0
	aMtjGnrtXgtGgjprKEdTKcCuaefP2CxPaReXd769D/aYkdyfRo15/RGvc=
X-Received: by 2002:a05:600c:6298:b0:489:1f3e:5f6f with SMTP id 5b1f17b1804b1-48d18ade677mr55583295e9.12.1777990223873;
        Tue, 05 May 2026 07:10:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f7csm409279785e9.12.2026.05.05.07.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:10:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Heidelberg <david@ixit.cz>
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
In-Reply-To: <20260505-panel-clean-up-kconfig-dep-v2-0-9cc31d6e6919@ixit.cz>
References: <20260505-panel-clean-up-kconfig-dep-v2-0-9cc31d6e6919@ixit.cz>
Subject: Re: (subset) [PATCH v2 0/4] drm/panel: Small Kconfig cleanup
Message-Id: <177799022301.801510.9046759541579593814.b4-ty@b4>
Date: Tue, 05 May 2026 16:10:23 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Tue, 05 May 2026 15:53:39 +0200, David Heidelberg wrote:
> Inspired by looking at Marijn patch. Since Marijn patch is not merged yet,
> appending patch to my series.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[4/4] drm/panel: Enable GPIOLIB for panels which uses functions from it
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ae3aa8cf5fd5ccb428a814e7eb38ae33ad1cfa34

-- 
Neil

