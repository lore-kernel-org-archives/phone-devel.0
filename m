Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E417C3B637F
	for <phone-devel@vger.kernel.org>; Wed, 27 May 2026 20:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779912494; cv=none; b=UOwBKcjeFjf/POh9nCH4AnBpNLiCe2DkfBIBThPW1ygkqlvzDha8R2Pl2big3+9VRtDtoy6Njy+8CruNmKmD1TgdWeo9RIcuLVmRc5ZACw9N+RM+dKEo2R6t22p/whtXKzB2CE5P4jviXqdcGW5zDS9ZF7MYzWMh/YPSMjjTmsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779912494; c=relaxed/simple;
	bh=nLaNjhV9w4LQ19tqYh4CBqpRid9LZpY2DudE26Y0cfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dIMFMDACwgxdcwYq5+b4X454IDlhNDcIlVjmzzmo2n2ZnKPGGKBowGTnmlGNlVptQpvQeadPOUbwL7kgJXGx0RW1pmhnNctL9zQisS3VIchWhATyZ494YFTw08FnWeaOla7JNEXT6zQ0iG1HmmZ3hpJYo16tyoeaKeXjYyJJamE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GC5Kkw1M; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GC5Kkw1M"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7c0de780bf1so106569977b3.2
        for <phone-devel@vger.kernel.org>; Wed, 27 May 2026 13:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779912492; x=1780517292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCyCktqg53OMT1gkdMQ/Nzei9mUmVcB94In9FoeM+e8=;
        b=GC5Kkw1M13HvXZCKw8n05tR5pJ0wJBcGUIWPfnLIToNXbS6NrdwIj/oVuLX6Cix/dj
         /YKIz4W1ehxRByHzWcg/h49IUvbAEfb5jJt8jKr/fRCsqQgvaz/QiTXkGnKk/calVq3u
         iN05aQD7iyI3FwAO/0ugq4nvE9B2bnjmPbnkZHpf6eQsoyA7hErVNKpG9OdhhhTyPJS4
         nOZMCmwpHTsIQjNZVnR3yJ9ynDfDyGPG6oU9SRRA0iBbdH659JPxSHJZNtaBzS/aZhsz
         KcvxxZ6z1M7U6fU7NlKotBWYg2AK11mA9pCdMj5ti5j4CWMSzy6jaInIr8os4TraypZq
         CIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779912492; x=1780517292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OCyCktqg53OMT1gkdMQ/Nzei9mUmVcB94In9FoeM+e8=;
        b=elAUbBl9lna9vclbgpPHE3F+baUwT920DdEPZ5PxqDvY4ycMcNa+xBF/uFzeDD7DfO
         6xiL+WxyPZ9difm8ISPfLP3duZPVvJ0bTyBqmlAHhiVxsai6EAWYNomB+HFVtfC9RNBR
         Xf9YbOJSFr1wBIzJwphPkL8UoudbupWUuLP8bOCb66i3YpZ+Hn+Bq9/GV/3UdQCceOZ4
         f9Z+yOK2w3Pelqv92Lh3mYRZV6uZqRiXd6HoTXhlmC5CRPe5MrCI7wcQAVLbuGfQWMUx
         AD9rp4mwtlP6DrblXjWBpG+v1rijrqg0ns0eg9c3kl+zRe7a6MMLg2uVAQM+Yse4dcGv
         huAw==
X-Forwarded-Encrypted: i=1; AFNElJ8oa9oF2VdEsdXSk8CMa25ZeUGOJd0KBi0+SeiMZDeRaTQPnTzJs5noyfmKk6FBIbiW2DoT9RTRatRoIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvBu/ExPUpzTdQTUhr68RpYE+u1aKbh8/iFRAMRmp9VZJ97vkW
	6GxS7KpXWZQxWfvJ3sBowj6Ebzzn2Y5SpSMugSAP98/6wpiAOKz0TwDH
X-Gm-Gg: Acq92OFluZxq/HnZ8/eRJsEW74FsMxeQcyaOA9TbeW+jKa6R40FfDwGd8l254Sc5cTx
	HXH0Ri5bHODYGmcsbRz3DLQLs5t03M4iOQ4GBJiVvpR/x/eeXEtkBztM7cdIRI0e3705qWyl9Nk
	pHnGjLofa5Tpu3ykjW0wcRMNsiUhQxCFjRDup/3grPAOLgeaMJFn07SRfUSadHXOXSzbsviOOol
	Dj8jDV9+1SPHmiOtinHO7OdgSftf/CIyGfsbmKFGhuLWMBq485Q0oz7hUDtpDNYL2QDhvF5tTE8
	NdVa84M+VsSfnXlpObVNlN33xSd39ZqkT/XIOm9yy71P3hV5TpB71r2pwntQK9p4jY/rEWa3jF/
	l4BpU5w91MNY51CaecqsOstdrT+q6WmxbKoNNUImTUgfG+Q7vbZFyHSAOPhTu2Inu7ODcZOvziL
	A4hYTzb+Xuqsy52sCZrOcbsdstwbIXgFd7GfqQLa5lSkbs7m0=
X-Received: by 2002:a05:690c:6d03:b0:7d0:1583:4cc7 with SMTP id 00721157ae682-7d337db008dmr256377907b3.9.1779912491951;
        Wed, 27 May 2026 13:08:11 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be36898sm79065497b3.27.2026.05.27.13.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:08:11 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 27 May 2026 23:08:01 +0300
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-yukon-eagle-v1-1-98119d64a71b@gmail.com>
References: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
In-Reply-To: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Document the Sony Xperia M2, which is a smartphone based on the
Qualcomm MSM8926 SoC.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..851d1b4d74eb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -99,6 +99,7 @@ properties:
               - microsoft,tesla
               - motorola,peregrine
               - samsung,matisselte
+              - sony,eagle
           - const: qcom,msm8926
           - const: qcom,msm8226
 

-- 
2.54.0

