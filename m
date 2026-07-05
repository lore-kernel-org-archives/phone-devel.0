Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8228C29D265
	for <phone-devel@vger.kernel.org>; Sun,  5 Jul 2026 10:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783247617; cv=none; b=i45C7k2Hv+fC+jzW3r99zZhE2qqUJU5Mp6ahDf7QWQZWWfrHoswLNLaqVAPiUuFG2Ts8ghKc8ZRcYDfn+VIYY04SJJPdBz4iLJI9Qwe+oh0CTyq7lSZa0yH8OgUIbsMSLG5TpRdflhrcHTgJ5YobsjPpjIPUlAneooM6zf4siqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783247617; c=relaxed/simple;
	bh=IH2rmdFf68e8sbNHOLcOM1yfWLZ8oytcgcEHqnHEMxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nirUF+HmuqM1G4O/bNsrxGcCpRkv8IJ/HyF6Azz9/3sgMGF7ZBLKTt8hSCIKa/4DxOsHwlvGzLJ72kxkSr5CCfVAsDVeK3rENWyBhpCkhmmNcxMbl87c0sFq6XydXQlh/zJ8o/gLJNE8I4OMWxg/qiBwYo7rnZSnZctW/+G0Mvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pv9fKxqR; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pv9fKxqR"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-804239c418bso22207727b3.0
        for <phone-devel@vger.kernel.org>; Sun, 05 Jul 2026 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783247615; x=1783852415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dB/6fGjmkTqxYckhOj0WVrDKQ6UfwK7gmAtGLmYXX4o=;
        b=Pv9fKxqRb1Kl5fU8y1gnXIgL6uVEe4I+gAxOxw3+nqxKVyjSpVzJxR6GpItRJFbhpZ
         7nl0nVwQwZvDLJzzXQ+RafVfRiQ9cVNUPvsax4NaBjt6rcAEIXlnkNpoaD32mW2TEDd4
         ajafBMTW5hSdRAq7Ls2QGSsouG2/Tfs+qiKh8L7iP9H0Q8XyfDZ4vTGzIy0tslvXrHyH
         bsRTE53LvxTybQiqZFOvVkFqqSiinpt45czwKsrZtmiVeGIXinLB2YttRVTCuYRs6Mkr
         +D/6jBqVDsdfIUVplD7mX2Broowlwvh/sdVHP9BP4GaWRsDMakCg0EprNTv99Cfz//ha
         UaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783247615; x=1783852415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dB/6fGjmkTqxYckhOj0WVrDKQ6UfwK7gmAtGLmYXX4o=;
        b=CEbPscpcQHs7XsCOoBiaXo08u4AJ1VUJOJguBAHD5hzQxcXas0/CQ7eqtE0ZvP9/Aa
         +5ji+0q95Huv9W4e7npDsgL43+W1qb3OV8cduTyttcPQWB8/WNbdcvQAvq0pOkKKFqC7
         ZcninL94kEdq9mq6uwB5A/ib/6j1yBOooMi8Jdi+ED4aG3UZM4H7RsiNXZOkfCM6ADqe
         lwUJr+cpWIrNI1ZdGh+Jp8bh6UkgsxioCOwpGeLK/V7roTn9wOIUvYubTt4A4SG/rBZj
         yB5R4YVwv2F8+pIwYWF6zjHsoNI1dhKBK/sailUzQe0URk7U78UTesoVwTHGUbriS0dA
         rGeA==
X-Forwarded-Encrypted: i=1; AHgh+RpoObh4IkytYgpY0QbrBnVdFb7hU9KKhoRPJbbFyukMYRj/xBwttvx/6Po2ZU0E9a0OhZq04omcF3utTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpWvtxFnLKn8zBRDl0HVtD0X4Awapy7mW2C3WsmDsPBIcAEZWi
	sc1orCmuXFQFHYrMn0pXx6JPhWk6QrhJKNlSyo6DFgb3wycbvJGCHjdt
X-Gm-Gg: AfdE7clIQLGVPUsXLEF+Mgxg30NOJOuidEyCwPxUdaYjmLGmnHdt6zyPrx/VD+ACETL
	Fhe25Nlogq49fBktYF9A7O6H1Ei44HenWx0T+idMbBNo1UzVvsu56m1uD2AuC7n8KfVyO8F36PK
	HJfsCO2t7Iopb/69Pf3gWacpGq9vGpWUpO10+9M5EBf9AXnx3bncCsWJ/RqE5qFrdY38UUQky8k
	0D60X0xLj1Sf9+k1MhzKqI+HqYJMWZ3feHtiyLW6wDUHMZ9o23IBADWatO/R/T+3zLLf11wQzyo
	1eI+ZqbJ3nSaGPdLQVbEASnyxa8Q+oZ8HRBEp0tObM4YKPCSqUhA1PlKpmMVNvLat6bxew8ux8G
	5uECQwDu0MX9H1vmCRG0nZhMz8Y7zn30FbKe2OPezEa10ChnePxe65Mmy18Cq0t1/WmN4NEG2uD
	1oxcYAEiopEm3bDegz6CQEpRW2cuMY
X-Received: by 2002:a05:690c:c4e7:b0:80a:9f1a:d48b with SMTP id 00721157ae682-81739bf2ec9mr69908907b3.54.1783247615583;
        Sun, 05 Jul 2026 03:33:35 -0700 (PDT)
Received: from crusty-box.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144ba2665dsm44421007b3.41.2026.07.05.03.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:33:34 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 05 Jul 2026 13:30:27 +0300
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Samsung Galaxy
 A52/A72
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-sm7125-samsung-v2-1-d3b17005ecb3@gmail.com>
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
In-Reply-To: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatibles for Samsung Galaxy A52 and A72.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9df4074bb582..45f35141bd30 100644
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

