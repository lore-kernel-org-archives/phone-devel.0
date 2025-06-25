Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18322D8768
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843133; cv=none; b=ctLmZLHtEtUE5Q9L/DvSWim5geF6r7kpZRzRbkC9NdCzfDDf1Co5E3tqroSOMgH5mgdiblwm6+e4tSD0RhJg/FG1SeJXj7gjKif3xJg7owZaCo5BaXBFY4sQm16pyMNZNOIIPUCkUP/DhysB2YdIGB35sqC2UxP+M7W0QKA+WNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843133; c=relaxed/simple;
	bh=ZOYKOxwr0N6pWmhEHgxblRjlL42AMNfZJaaOJ98e6PA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfoRKIgWqN2mXgsenYWyX3S2DOy1KluJuKO9Yua8nlsLieth6Vp8NBJb3KyxH8aGPF5Ra9UU8Qha6/CYdR0PeP8tISvORlwmmV6F50TpUHIrxgWxNB+9KUednNF+e2iZJTVGv177SbZVk/wfFbiNpio5CkOSnsKRPEDpRl0VHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RXuIo225; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RXuIo225"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0c571f137so76100266b.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843130; x=1751447930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kOHGqEvSGe1UBVUsrAHdsFwcmzz3ykk+SWQLbezNrg=;
        b=RXuIo225KwIFmCgBi66Wa06PZOidnfLXMLXo3mhQ7xTd162aQlshwO9oxxvX8ZCf9F
         eyKglI+PZdw4X1L1u/COsqFupibFyicvyB4NWqCHOgMZeTXi3xsWMKwLZamqD85CPFLZ
         twKReOKDN6EDifYZ0HjwbWKit1XMOlx6UkeQDoACJrUcV1z3wVHOOGNkVulR0f6pJtwn
         jQDfvMdVBDq25opwiLdHgjCQ5ofSXkKVV/FmKRqZb+UmrCT128dmmpu+fqBxHwpAoIYH
         bmLk0rTWAfR+WcywtJVvAPnFlcfZT7q49FH6TO+2CBgmSx4IcnyoRg1MtkJBhSvs5dWr
         3RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843130; x=1751447930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kOHGqEvSGe1UBVUsrAHdsFwcmzz3ykk+SWQLbezNrg=;
        b=sTvaOi51UScmo8Gc8a4yP9Riu15Pnqi0gi8fiju2yQGtiMo7qPaC78hFAaXNRaNc+F
         gXuwNSz8CEJQWqX7WxkV/HDjheqYZoRZ89qfwoAHKqIKMAya8itvUDshrxbHiVE1hlwo
         4ImJwmgFAWikO9G00gN+wjL45lO3YJ7eGN1JxvPPvUcjzKxkvnEZU9rhPG4N1MWAFwQo
         tChmiXcvcOMwDc9ADe9UCjaDKEGg1jdKSkOEvc5Edj+xE0Cc3ueZLbilCpZcf+ERbJ23
         4fp/bXryviCF1YVt8z+p1makpvsjE3xs/gUK7ndfWIpvzFdTexcsbhdMencqFcwTc8f4
         cncg==
X-Forwarded-Encrypted: i=1; AJvYcCWVYp76ea7B0zeo1adw8+EU9jFnrSR4c5KOA2bRaKqS0ZSopN6TgcYj66GD/Axz0fQPA57VMMJoJpgrxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgeRIc13jEG3ET9SfjqZ0GXnWUREYf9IBRRVlNEX/qnebQ84Se
	q8OIwQR3h8PV4vbBOYlKNOn3JjizfGzFDiU3A46FohvtGCYUN9CCaGQJYbjqNAjkFO0=
X-Gm-Gg: ASbGncsvKQKZt9OuanL6knCMklAc9w5qQ79ARJvLHANc17o2MF2EjaZaQaya1BBElLK
	/bTiXpbjxK7pDPtRmb/qhWUUUqGiexYzsmgojK/yar+veS8FnZFKY8pJrBVsa3pXTbT5oqAe03b
	pqZd5z65MjGlto5Hep9h8z6CTg87yBUgTLGwCTPubAMqIrhuUd66jONay2Kr/5OTW8bd4+MUSO4
	fqqaThh+Uw7cS30KY2F+eMi9EYhovust2u0kwG1dynql1hTo3do/BjSltsxvU/D4O5DinQjdLBT
	1+JQi45L22SaFQgxh65LDZ/seMT4XOqLtIYV2C2JecyPOAGNbI0IrnIGTg3/x4cTX71xf6fGk2h
	iTe+swbRSj05/0WTxkIpjF9lY6jhbKDNA
X-Google-Smtp-Source: AGHT+IGxeI1ny65NArixLKEAHnqARo1P03fUWKEf2NZh57NeHRK7sKsw1QyXXl5uOkS98J55IFCCIw==
X-Received: by 2002:a17:906:6a01:b0:ad8:9257:573a with SMTP id a640c23a62f3a-ae0befe0a23mr205593866b.5.1750843130042;
        Wed, 25 Jun 2025 02:18:50 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209b81sm1029043866b.171.2025.06.25.02.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:38 +0200
Subject: [PATCH 2/3] dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230
 PMIC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmxr2230-v1-2-25aa94305f31@fairphone.com>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
In-Reply-To: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843126; l=811;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZOYKOxwr0N6pWmhEHgxblRjlL42AMNfZJaaOJ98e6PA=;
 b=VLU7REoYnzlQtwhzlNChJiU3xkdw82ByPkXhgYpCw5p9b0buePSV17RgciNvFX34r3/xDTZgT
 PLcVJbdn5wWDvArwbOmF5BN0me2ql1Q1HPLEdwF40cBKiqkEe8i9gHs
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the compatible string for the PMXR2230 PMIC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..5759cdee7237e0fee705e13288a4255e4d0a83eb 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -97,6 +97,7 @@ properties:
           - qcom,pmx55
           - qcom,pmx65
           - qcom,pmx75
+          - qcom,pmxr2230
           - qcom,smb2351
           - qcom,smb2360
       - const: qcom,spmi-pmic

-- 
2.50.0

