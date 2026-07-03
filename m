Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA16371072
	for <phone-devel@vger.kernel.org>; Fri,  3 Jul 2026 08:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065623; cv=none; b=rn2ucw0M4OACM+RKNmInydPX5AQZXTm5S5pEGvxaXH4PqcCwJ+5Vu63SfI+S+CsIC3r1NNOEQziBglw/sfM5nqLlkl6Ux0pCMTgdXedS5i5GzjDBP1HFZ+97Bl9Z7WxaBDtmTkIKa8VC6C5V1rkFlEyRJZ1KAYFamzwvoPKRXro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065623; c=relaxed/simple;
	bh=xujQ6tDNZ1nxaHLTf5mA0a97sQ+9NIUOoUvAIyLbYAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dEHgfr+rARtIyopuGImsDrrLwCr9UZNHUYmYjg2SmGOKRY7OItG9ABmleg4HIs2Mqca4BVCR1YJpuznjY8quNoM6WpAJBldCDt5hWEix6SXDVlMZBrxxWl81zwjRngIS8SkaoFM6R+iK2aA8XZTR3oCcafJm8nk6/icgtel+RNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVG3xW2D; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVG3xW2D"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4798bea72f9so180419f8f.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Jul 2026 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783065621; x=1783670421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJScOyDCQE/wEAQrfCzXHIwfqBOTOfCYrc2Hkbsw+uI=;
        b=OVG3xW2Dg8lOWarXoNyfAYTvLPrpGd71m6s/dDEBcdUfWP14DRAR6dBRtyDV/kvOYW
         0XK3Vns4JjNfRqbuC/fB1+fyPtCFNpdFViLa4bhGvF8Iv4jc0FMW0TCphhEWFN+DwQ5y
         odkvB+PTipL7jiO3nO+wzTMHOavjld5oHJO/CJ0K3EVUGtugVbPkniwn4DUjnKhucJGv
         /uz33LjdHnV0mf0fgrHZQZiKH+JuxYHiyEFEbOd+KoV9eMnJ7TzdeADBD3aS0IT2UAyu
         dvUsUj8rh0XNssU7IAR09FzUjUEqA2zblOLxNY11QrEpLmvZrF05ekFuJlQi8PNX11fP
         9NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065621; x=1783670421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJScOyDCQE/wEAQrfCzXHIwfqBOTOfCYrc2Hkbsw+uI=;
        b=c6L+2U+mquGh4J/nKFQQGAIraA77nMxvM7TnNjzIzcgFPBT+PODhBySisr412DAfrj
         3Js3fK/H5Dcs7Ukq14ybSfM/lO8W8ea2JqDXy1M0SvbpcYHL+S6qOEQ8toyo3snWbYO3
         JDAnTMVQYif8Sbe9REZ1L6B89aD5W9GnAqtsNuUvTCQDglfHCPUUWoMosGroAasp0NGV
         aIiKveDXda/rcQ4mtubONMFnryclOD73Hi760aYRUo11e4AkExChtgX86h4tKQzA32kj
         YdsjHFyXKHchQ/1asv1G1qirF5H+rhINyJkHRvcJdMDORibQJVF1FsHDwkQnbIM5o5mo
         ZDsQ==
X-Forwarded-Encrypted: i=1; AHgh+RoiuMxme6PWL+f5gSButkTJs64Ob/KirxhzsW0CHurwOJIWPuAvE0eGhoGrMmYhnAsCeJUC/Aq7Mm+izw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhPqt0Aufpuk4ysJOu5fAMrpj3SBh8hRmXt7ZqQ1Funa+nocgl
	VdWjWLzQFHUxWI5yY0L1UhqxbvwCNtxT4FzHn8ibkN1yR9ofhdXogwSR
X-Gm-Gg: AfdE7ck4/EjSj8NdFSpcUCh3HyAMIQqkkzIyeEplKNT9gEsb6nIG8z7uWAz1R67oVev
	xXA6OBNOFaomHsMpUjLteqV2lhpT8UykPgXuEDcVD9n0/AoEwk3af8dhqCWcpjC1ylfxC+C8xwt
	W0A81dT2JlsGzsOFmNEo9TCMAP/zJpay9ci7y04fezgC2iR3PpEZXOhjJ8lrp9bJX+xiky383tZ
	wjaXoKQ3uf5qMnfoG884q7GggbK7dGRV7EDV6xaXm/CsOIxUJsUrlA+LU24BEvLN60MJxVr5zWo
	EosWImZOEGq/wyLWL1Ntpj6uvjm42ErRAGzYEpYP10TpVc8edVBICNMEr+da/KU+a75Wzz+F7QS
	yAf4aP3KkWyXqAyn+JVzyFa5N4UXVjjXunOgu/82NHEqOYHeLcCOvMtnHvz1rl86iIuEecfx9kD
	Y5kpHZfHfFShQIbWPLzw==
X-Received: by 2002:a05:6000:29db:b0:475:f0c2:5b02 with SMTP id ffacd0b85a97d-4775b45b05emr10239148f8f.56.1783065618490;
        Fri, 03 Jul 2026 01:00:18 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:cb6f:2cd6:80ba:ca9:891c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477d766e0b4sm15116051f8f.0.2026.07.03.01.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:00:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 03 Jul 2026 10:59:38 +0300
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Document Samsung Galaxy
 A52/A72
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-sm7125-samsung-v1-1-3e5f752048c1@gmail.com>
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
In-Reply-To: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add compatibles for Samsung Galaxy A52 and A72.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 667607ae2c32..ec3d9be06dd9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1036,6 +1036,8 @@ properties:
 
       - items:
           - enum:
+              - samsung,a52q
+              - samsung,a72q
               - xiaomi,curtana
               - xiaomi,joyeuse
           - const: qcom,sm7125

-- 
2.55.0

