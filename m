Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AF63911B2
	for <phone-devel@vger.kernel.org>; Fri, 17 Jul 2026 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288734; cv=none; b=iNzwA5AHhDnHTeg5OdvjUaVTpP2A8vHu48H1Z5zq4qPuQAXLXYze5wimp4xpnbaoUbqljBWdEGqadqdHlYgr4FbO/8Wi8vXjunXws2MjFiY7kDWQYZwHkOGjnmzFHKw7fjYbJ/MOfBXfFviawtOY7ZrS+lmSBNSOIReI+osWmRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288734; c=relaxed/simple;
	bh=Gp9rEZnBlCdYZ83KomJ1Rix6qPb0mAp0og56IEFZHZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mg6LjOLnTPi5i+Ad4ZMfnZNO2HcTD8KVVPZJ5t/GIRjQnxMALJPhxmneOwsVduNhNsRfXf8yZSVeAjhrbKUNfObf16P/6PBHqFsUB4Xs/OuoZRSGdV8UpYomBxGC1uixR3rMXaw38n7XIKnQiWPRdiaGZ2+4NVG6Gk23pw3PCOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wW8YZIku; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wW8YZIku"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954d383e64so809785e9.1
        for <phone-devel@vger.kernel.org>; Fri, 17 Jul 2026 04:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784288729; x=1784893529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4pJ9iuKTUV6iyRj89cg8Mv/REeAs+Q/BrxX8LSxG30=;
        b=wW8YZIku8uWaR2+cXIHwGaf6buawK7buWuIoJGTv41YmztDBiTJnfbIs/h5e+Yfuj9
         N1OlwaWfP/a534pEIVhiD1hqUAkyRu9GRYZ1Vbq9tA3MCkbgAOXya7ONAwsYq0R9tisx
         00d4VhfAK7VY9JyQmmygsMgV3pmR7Qy8DMiLqKbKhmagSwFnQtHmFbxPU5Rp1q+OSZH0
         4CaacT8rZu5VZUyE6gpkCF9tLJnuDoOyBLrcC6xk/EexErt7upaYMYXwhbPpnZwlg0X+
         9LXlSZPAHM6A3JAk58+3gti9Jz0zmj/wg17vgUe3w1hS6rGztq6KwEsGgEjYeZwYwMXa
         3LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784288729; x=1784893529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4pJ9iuKTUV6iyRj89cg8Mv/REeAs+Q/BrxX8LSxG30=;
        b=rOEa+PFp1ye5hnL7HdSF0QnTyVfLtR7NcUFitiby88nS30Fu9u0dZpUzRGkew1FwEl
         DQUKDCJVbd+Jd+iV8zXgyeqxoOcdTZGg++AuMyAwd8saLia8yzZBIRIF/65kWvnIv6Fc
         6PA83GYBw7xv/7kRMNVYr6szpN/aAbbY39GrX9xh871SbzZhkcJNEy+9pndFsY0pMxv/
         jxLTIyiiTb1CyLa8dB6P1vP8EI5hWCY43rTr1dps6FfZQY+dzNsM2YkMgzMDWlVlwO5n
         7DswCCb7SfxxNabwlrMWsGSDgqiHeECR0+JKPqZRPJZ9Zd3L8S5UdBXz3o0oYAP4VOMT
         Xx/g==
X-Forwarded-Encrypted: i=1; AHgh+RoAb0WYr8nqr5thbnSWxqsDh79HQq+OtJQBYhYQCqGLLgFEFopfq3FyYJZWizrImYopY1Fj48Ruk94gLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynO8O/bybzfB8TFXgzjsci1sM4d4kBgUBqlRFg89oNs89ysRGm
	dUIQ/CZu6CCet1xYEYsKsinWxFk9UxM04R5mAFX7G7cqDrzHgk+rwizqCSad+IKm1xM=
X-Gm-Gg: AfdE7cks3YURjkjc01BEcVa4gM7tKSF0074VaLLzdZNk1CVEng3vku57I9P7Dn0s7Jn
	put9GV2iuXpoeL+vdIdyOtyacJn/+7ZcfygdVQ3pMeDl5qy7OEdxUv9X63qOaTTXFQ/En5d/DOk
	dn97lX9nf6VZtNwjzBkM7YGlnzxNVU+zXEWTg5bgXPAcXwTd0HbMGtrIpCFYCNb4S2lysa4E3i6
	BHx8FEBJLxIuVgcr/Cujwt2Qsd8uk0tjcSfruTmRFjbyL6FR1TQEdHBbEDHJcosKIWbHcH4ZBJL
	8qdt2xhMWI3eOlKhWAorWy07ZHMa1+IHjPmu5PBqXtO/FCeICU1lGub1JRK2S1RC5NvEKtN/Lqb
	Renqj41YPn6SvsysrKt9VbaIY4dTkg1Mz9JXi/igCW1Rcgwyd2iafPLEbQBYlUyOySwsFZvk9wY
	gT
X-Received: by 2002:a05:600c:1c0b:b0:495:46dd:e238 with SMTP id 5b1f17b1804b1-4954a50ea30mr28928275e9.30.1784288729096;
        Fri, 17 Jul 2026 04:45:29 -0700 (PDT)
Received: from [172.18.170.139] ([185.104.138.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm41353855e9.0.2026.07.17.04.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:45:28 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Jul 2026 13:45:02 +0200
Subject: [PATCH 1/2] dt-bindings: interconnect: qcom-bwmon: Add Milos
 cpu-bwmon compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-milos-cpu-bwmon-v1-1-dfe0bac9898c@fairphone.com>
References: <20260717-milos-cpu-bwmon-v1-0-dfe0bac9898c@fairphone.com>
In-Reply-To: <20260717-milos-cpu-bwmon-v1-0-dfe0bac9898c@fairphone.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784288726; l=940;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Gp9rEZnBlCdYZ83KomJ1Rix6qPb0mAp0og56IEFZHZg=;
 b=x5sMB4LhOoiMg6caeXJmg8aAp9bmLEHqIa7MZpv9P6PG9JcZmMQrCEpDiXG9fnuO9V391JC1i
 oULEO+qXM+lA9p1wYt8fOGCB8jyNQNP9+iHRbNR00Lyw9izp5e1ACE3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the compatible string for the CPU-to-DDR bandwidth monitor on the
Milos SoC, which is BWMONv5.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index c0a5e925ff95..4e33c75d9243 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -49,6 +49,7 @@ properties:
           - enum:
               - qcom,eliza-llcc-bwmon
               - qcom,hawi-llcc-bwmon
+              - qcom,milos-cpu-bwmon
               - qcom,qcs615-llcc-bwmon
               - qcom,qcs8300-llcc-bwmon
               - qcom,sa8775p-llcc-bwmon

-- 
2.55.0

