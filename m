Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A96B1E51EB
	for <phone-devel@vger.kernel.org>; Sun, 13 Jul 2025 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752393988; cv=none; b=gTVrnb3FsRtMB46DHpO3GSR7k4s9bMToi7bgZv5IF/LbDHYtQZOJOxVmrrDSSnjQs32KT/S1qxR97R+ipcAaP37FCoanU0kI3bQgpfkwP2xCg+f/I3ZuS71OZc7Nza1fNnBN41sXnSENutz16d5uJxFng7id+qkW6OASLCKzE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752393988; c=relaxed/simple;
	bh=lXJt/yDsoHDSuPe8QmNNkzF3KEBLxNVR5QCRJEM7U6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVO4euvlYwBF9569QzjuLeYk4N+bZR7pFVWwNrqKHAvepsvcgTECjoM7RVNkmK44BYcKDgz6gC9jo5xU4Kex/vu7Z2Nfutdksy3CoujeIWuZxnz4i/BM+EXHGQ94mrEF0x4E9dTsLVM0Nzxmb617RCBaHuqRyQZjTStbhs7H+W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KAjsyGaq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KAjsyGaq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so12081895e9.3
        for <phone-devel@vger.kernel.org>; Sun, 13 Jul 2025 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752393983; x=1752998783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3MxjLEtpRVyTZFb++atMk5EZAHm1SNpE6rDNgKP3WM=;
        b=KAjsyGaqy53gMzniftyt3noWtbYuECU6ma8NVW+SKilgvESX+YXzSkuG+wogG3DutB
         LfXLV5bstJbPDK1gpiu/mlGvIkhWHcbOeGQoct6jnaDl34mE5OjwaBzXIWiB3ijFhLRG
         huAIRoVaxscaMc99OXH9ytq4Jm51Zab4rZm2OUkr/kfEIh6yico8aKiDDTPv4e5XafPf
         PY0M9Zg58mWPOsZeBCJUKfgqDx5u5n+LpunXEgKWDV48egVYIx+9gT85/k8NeT5k3Jao
         gSmEuhXSr65KhWo8cszu1diFaHZyRGfMCWGeUBVlo2SE+9kJl4y5Y7TQnO00YZrFYGzq
         srMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752393983; x=1752998783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3MxjLEtpRVyTZFb++atMk5EZAHm1SNpE6rDNgKP3WM=;
        b=IZOQbtzEJiNwmxxZCnjjGSwe9sZ3PIKkGKcUjH1hrlQHar+twhdXrEyxAFdm+l78/h
         N07Ij/nBJ3r+X7Vcu/eo0L37DYwiVSkiw083NK0dBkFqRxgLglHN9Qgw1B/EDh6jJ8X+
         07CBgOkd+EKSOq+Dst9KhJRncyr1Zu9wG+mOLtvhw5zrToEo6MO+dl8+B8Db7VyHfjRP
         dzpFc+rmVQSar5JGCAXonCaSThJNW1lZg28vObOeJak0NHKTAp4Kt3JFQZHRnBreG7xl
         EVZCCMdnkXRfhzB4f7IIBqa7EI4D07yjdhWFqz2/QR7iSz2x2sSwAvhUKE52gIpNMfVX
         DxvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT52OueJpg/YZ3kKpDNcw6xQab1Wi9bwthUqrjQIj9JKp6b5FhygU94VjHNOv6fm1cltOULBRiVR1T7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzldXkNqVxjC5iAMYCDGk5Rx25/NafsCXic4z0hpclRIQDm3bzL
	S0iiigoLMSY5OEzZF7XCEmjnrFH87U7N5IWIs8LsRU0hoYpMMeyFgej0jMDbD8MZyps=
X-Gm-Gg: ASbGncvBLvEZ/0fTdkLQMJXR0ZIV5OUtghnvK/utIes1U+yZrMIXruEXpU8vvZ9c+rV
	tZiI3ITnqmXcjxHDL53MyXC24P7tVKIUtsHMIMew6nBGs9Cj/1V6yWnyoMbGEJ3T6cONfyUpQXq
	iRLkr0QPRDbCjKIzbvrycAeGIw2oPsUz0ri+CqkVtdkQZf0buTLH2lQXbedNmKHtCYeCvLdwZYm
	GWAcFW1Ivk99MEug4gpGmTtP0AfCTJ6NYxyfUSFS8W8oJFaqxdoIuvhYNtlYuB2JIG+MYcbSNuP
	5lPK2w3T77My0k1KcUfqCj8EBv/5ZKtACPwLaLHPqyf1tWtbVljOpCXr7bLYu5s7kq0FC7nlJTh
	cW5+gC50TQerVOXCxvNqrxKDJVDXrz/0HezhGHm+U+vQ6h8w=
X-Google-Smtp-Source: AGHT+IF2dijl2kk5jegjtYU+p2rAjAUxOPkElW1UrGDWDO80C/PI+gSKcgMJoxorFBd7cfrm8u/VBQ==
X-Received: by 2002:a5d:6a49:0:b0:3a5:2848:2e78 with SMTP id ffacd0b85a97d-3b5f18ceba8mr7079826f8f.28.1752393983475;
        Sun, 13 Jul 2025 01:06:23 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:06:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:25 +0200
Subject: [PATCH v2 03/15] dt-bindings: crypto: qcom,prng: document Milos
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-3-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=875;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=lXJt/yDsoHDSuPe8QmNNkzF3KEBLxNVR5QCRJEM7U6s=;
 b=YWlNKu1yk/YAFD8w90VWlOFTNCiHXfhuYzMgW1x9mK56voio6ksNRmFDk/XDI+kjQDc4mizBK
 mmfj6LeJyvMD7UovUB4bVNyGfJtrvgMzTuaEsoMvHBWmXosueoYs69L
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document Milos SoC compatible for the True Random Number Generator.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index ed7e16bd11d33c16d0adf02c38419dbaee87ac48..0fdef054a1a30c363e0d99518351fb18124904f0 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -20,6 +20,7 @@ properties:
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng
+              - qcom,milos-trng
               - qcom,qcs615-trng
               - qcom,qcs8300-trng
               - qcom,sa8255p-trng

-- 
2.50.1

