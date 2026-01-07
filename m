Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42B6224AF2
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 08:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773177; cv=none; b=jwtmpVFTN6H0bgX1ydmWMIWy78GThHJQ8wzJCaScdDsr5DY0UYqlQs0uyBjWGGnmCOM6ncT5WAcGC76607DQBRspot5o/qcW09cxdj59LBJdTq8F9rxB8lXIUaJ1MGJphV5kjdvmsit2qpdGP/ru76UkFvKyoIEKYsuWtbN9B8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773177; c=relaxed/simple;
	bh=TJq6smJNpzhUyCl9pcUEvogC5t0FBsHTmp+T+Fq62FE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmkCjiDb8S91r6qjI2hMwEKZ55RxjHYP7hlphXKx1WCBhqs2ZIeA0Xa8P2mMMeo/8adNPbJmF5vL3y6GOEq2gbEMxAxvw3ziUZWuE1tQhUnPUd3AhdBAedJ4T2QmY7+01mCeRGEMv4G4M8pk1P4Wg1U/LTP9COi9Iw0lPcv/Igc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UsUyi7qn; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="UsUyi7qn"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b7eff205947so245782166b.1
        for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 00:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767773171; x=1768377971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsHvzqbYWPHqvIyyKZ5ziYmivvXzm7HgbZNmFTyTVlY=;
        b=UsUyi7qnFEqQrd8+g2l8PgjpdMne7azKR+mo5jGtV6mEMTKzEGxAIqC/7TVyeZTVrK
         rvyu4aO4h1ClI8H7eyRE9UorThQBBpHNrJzsyZpzXGCbqjIhAly46i3Q/847uLHWhrMt
         r2ODc8aCISrT1j/3gvYcjmHecOpOr6RGLcsOj68+LilNT6wct7EOMCM3U72VQb6occD5
         3GlTOZJOPyixqJsHqsCnFdv4esIraJLHC/owA/0FQqMqfQaWeaSZ0h8yMtg4cM8uvh2o
         RTrbWC9YfKCUJPG7WOaY2Rhx7q9Za6NzIVKqQnRtSynx/2y4vOwrafZ1w5SeGab2k7gJ
         TP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773171; x=1768377971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AsHvzqbYWPHqvIyyKZ5ziYmivvXzm7HgbZNmFTyTVlY=;
        b=tCpu5Iaorwe9g0EyRXojTmym7gafEg7ZAA9fnYeKyfVHumBUi7MAmmg21O6sovTAAH
         gfueIbRk6OrGmNXO8eP29nt6F7GejC6IWle5c5z9XDbnqNvaeyLlcaEM/7UJ5CFd1rG5
         cVUD8U80vhoFVVkmVKENQ+5XeWWSXo1AYU7j1v3ICwhJaS3qBbL/2nRLqtlqVKuZr7ZR
         9vvci4IJX0JeEt9wXgj2yinPIUB5yUtI1jE7AbNcqpxppOT2WSkHw6EQUEDwpxFueNyb
         6FTI3VXtMh/vNIR2QbnwBYJgIbhkx+KOYGu9kKnoVS/0oeqkUm1lI27JQjN4fipZV+MP
         iUPw==
X-Forwarded-Encrypted: i=1; AJvYcCVIjlDYkWw9DFbXHDxwOGMRuKK/fkphZ+g9LTrSCuHzg/K/ir0Ja4qxksKphv5Rno4W9drsv6NAmZSWmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymEBE3VTkc+2Prr4ZGrtZbkpSul9VGhhYQpvGjRHtvz7ZvU8f5
	s1Svtta6AGYysEJ+KINi6oLnN4QP/8f+K4T+e0YN8UVFdhSVkRmpuFq22NmZ7GgRLQ0=
X-Gm-Gg: AY/fxX6aNL6nzDcs/DrQ4d5wFLUxcTH4al6gHEwp22ne+KL+q/lbtXEu56+uYOo8PVo
	tIl7wpdLx6zfW9LiBxhnp8F9Bhb6lQp4NA5v8HSDs7RkLJMskosThgC1sYdNTmOwvA8F75rZTYi
	wTh5j5tbJS3sSSjbkVx48tARQMxx8ZhNevFrtFDS4PjUlyxtLCEcZx6yjPACzuuJHxUvj9j2xwO
	aEPQEvkyiAn0FA1cqrREoVqFFbz+A/7nDOqtVu0VHGvSHFwXj1vsiUFYsiCxzsSOtwAC+Ht5Nxd
	xW5d5rN9u6NY4nQ/6/NqGnsuCH0jZduz0DVHhgsd7D8tGUUxugV9FXm7HFmcH6O2igaIKw0oeRG
	4ph7wWZbBgluGIVxhj9woDCY0TP3ZgJDPkiVC5QYxoLbyrcEKZpar5PpTEvhIYSpi3viP+hdzpN
	vEIPhO6S7NnSKZBXp0VO8aVArXng==
X-Google-Smtp-Source: AGHT+IE4p/vShR93wKW4ZJiqzHFOVPLWCJgnEqo2jRVbm+FDwTqLGqE1aGXNP46YX4KBtv7HXppcKg==
X-Received: by 2002:a17:907:72d1:b0:b73:6b24:14a0 with SMTP id a640c23a62f3a-b8444c9f0eemr155635166b.18.1767773170902;
        Wed, 07 Jan 2026 00:06:10 -0800 (PST)
Received: from [192.168.224.78] ([213.208.157.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm3941299a12.33.2026.01.07.00.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:06:10 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 Jan 2026 09:05:52 +0100
Subject: [PATCH 2/6] scsi: ufs: qcom,sc7180-ufshc: dt-bindings: Document
 the Milos UFS Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-milos-ufs-v1-2-6982ab20d0ac@fairphone.com>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
In-Reply-To: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767773155; l=959;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=TJq6smJNpzhUyCl9pcUEvogC5t0FBsHTmp+T+Fq62FE=;
 b=SDduZQ32z58+v5112RpYgH7igk0LTEEt4gvQOJlOViBskefmZPWHVqnyn4YLFTSn/Rxj3XIvm
 dlb0sn0jl3AAlOokauCExkdezRA9GPP42e6wIixJKqAMRF66ZMZSpuJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the UFS Controller on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index d94ef4e6b85a..c85f126e52a0 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
           - qcom,sa8775p-ufshc
@@ -33,6 +34,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
           - qcom,sa8775p-ufshc

-- 
2.52.0

