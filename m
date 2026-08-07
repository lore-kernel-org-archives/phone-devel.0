Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657B644237E
	for <phone-devel@vger.kernel.org>; Fri,  7 Aug 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106050; cv=none; b=eRpQ49eZ1H58EHsiMvDmkFxIJL/59rfHXHXIWk+zJL15xxDfpXNe4ktfUR2HLVaylW7lIU86o8barLYBhcVG6I7JL4SFykVWtNvYUiSIItEwdXBim5zAOYjgep8tPLNttUvcxaoJMpsFBlTup3KTSDfVyjve/6e4JZo2np29Gp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106050; c=relaxed/simple;
	bh=swvAJsMf+noAdjAOdgZgJcavQOiTqHlXuhgcaBqarWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIj/ftSJPWVuWzTIB54oIzAc/JivlPJg4r2adTqzybnfaVOQpLg5IpUM2eFF742PcBAWmbBhcuz4mGjluNJHUSl8AoXGSjbK6pxdye6NSz4twTNETfHqoYCR3JkoHIGTUfNXcr6oeZasf4ViGYH37U6JSOk0B+OT8wqni1AP/UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfX2s1Rh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfX2s1Rh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4955de8797cso23061015e9.3
        for <phone-devel@vger.kernel.org>; Fri, 07 Aug 2026 05:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786106044; x=1786710844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jo5o5mj93URUeV+7YiIiV0G/8Hcjq6XVQrtqV+XyI6g=;
        b=bfX2s1RhqrVvdkhe1dxYDU6G7TaKw/m7GHvsffzYiUVhiN6OweBovMyUpLaNtKIHn3
         0NXQrMAnr5lzdomB/kY8AjqA9TZ5Iq4FeH81Y/nGpNVGFIEVcyRMRVn/p50MvVJhB7wd
         QGIAKczXzBy98jQNmRbwucCdmzkbDviBVQpOnMLMpOKJshI8/e0TR+2wrkuCieyBWa7g
         FK1JBpC6t/7CVvvtjq8Khqvlc9X/51b7tg9w8eXqDVdHcqZb5KIhrKBCC+TdfhgNnXYz
         //zZkoWuFvAthyRnSEkRVRKILMbIWxPm1obDLfI6lxQv1PzliGG1hKlb51lupa3lld+e
         hwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786106044; x=1786710844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jo5o5mj93URUeV+7YiIiV0G/8Hcjq6XVQrtqV+XyI6g=;
        b=MtrWmKj0rlHXHdRZiPdxHkUCOD2FFtUJuxy+8ADW2tX4iQrwvTsrPTqhA8GCSRVVF+
         QfGp4q2i3BGCNvJKjJphxuHRYKqNmylxxaDOoEK5Suj+fLjDkkhVE6ZSWMvXQUpbMv6R
         0yNJ68m/awT/7YDaskDxOvI12/MVtjJZrGowd+/RiYLl42ml9IDeYLN764UxGuzsn88O
         GzO71YbjD1rXr1JiDXN/m4ZGsrDwVPZvIZTKV0rV4e6aVSu/+9o4Z0J7lKzpYdOGt279
         T3YMcxi2ipkjOtyqXHiVQpflS+bOfnTAm9ePEE+Z/9g47N87Vyq4UZCNlfEq0Tca7fFe
         qohw==
X-Forwarded-Encrypted: i=1; AHgh+RrA6bltivOsIBV2a5NgXkmPM71zZAMzgqRLbC452cO76BaNw4zftxP9XfnCUH4EFjhlS8RpZAf/oz0U9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh3BU4HyAA/OVCOuNx4eqFtONS1dzYgKcQyupczm0VTE0oUVZW
	WVIUCR86ffTZJ6j85wnGlWZ+MWiVR8vck1XvQhTdLVpAy2oJkMXKoWTQ
X-Gm-Gg: AR+sD11tgPGPk82nm29BBUHuC9Sr5b/o09r4UQjN+O0bBXwgQzhL0kn/gg7iiTTGSOO
	SboddLfZ8vbddvqlI87JcGRT54P2ghjJGBjQL9/w+P81kdCknuP6ea7zcas5uhEZbYEeZJZOjap
	VQ8Dt3aRIMgfisaO5D6OKAPw/boZTXGyk/528Ro0DYNz58kiQ8pcrVcmqaVKueStj4Np4NgyoVE
	qZtTurIPz6akVEP+nBLjmLwSd6ikgNFS74i7IygQdGC3ZS2VqIXLm7KmomgsbINJWdmedez3chj
	BORHE2RYz6fBG6sFeHr6M1pYJDRl/twn43KgSHc4dPx21gTOS5p1tHeJnapZM9QSQc9hkoogdzL
	KcDXmSlXyvbvIfyN0/RYkIdyL+Gysfm8HaDTkrwOE3c16fskIeXM4obcFQonUgXwj5Y6fYBi3xX
	kxC4lFy2PZSeXsI2X7bR18iXDJxg1LL6+ezw1yl7ob/FhmXzM8f8Iv7JFpgW6o/SwS
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4995e084875mr42434335e9.7.1786106043871;
        Fri, 07 Aug 2026 05:34:03 -0700 (PDT)
Received: from [192.168.8.167] ([2a00:f502:270:d465:a26c:adcb:8da8:6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdca3ddsm49530495e9.1.2026.08.07.05.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 05:34:02 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 07 Aug 2026 15:33:30 +0300
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Document Samsung Galaxy
 A52/A72
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-sm7125-samsung-v3-1-ac0139e5c612@gmail.com>
References: <20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com>
In-Reply-To: <20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatibles for Samsung Galaxy A52 and A72.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..d3746bf6a106 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,8 @@ properties:
 
       - items:
           - enum:
+              - samsung,a52q
+              - samsung,a72q
               - xiaomi,curtana
               - xiaomi,joyeuse
           - const: qcom,sm7125

-- 
2.55.0

