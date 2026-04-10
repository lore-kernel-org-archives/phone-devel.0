Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BABE3A168B
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806824; cv=none; b=Ut6/fM8R7cDjJGPbDbVDDOTm4Ul+3zsRGFFVkZSaG17BIWU2MHIJftXG/Ac7jUUe33M4YPwjEpwzAlUJWt0slluQIUX98APUyZ1pnWWz9/ydXOKnomogWCSKC1/ttlqNFKn6L+OetrmW5nIgxRv6rwG/Tr0PFVBD/S12u77H7rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806824; c=relaxed/simple;
	bh=y7kF1wWPK+6FLzptGcrgDYcOJoYLZeLuaC+ADv6HIu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1ro562ocdLLQ1Pi8gg7pzln2og52y67GnCUtzO6eHUGvNp6HphkHpLmTdFWxCI3mVLPt5RW0Ba3XGkzs0mQyO6erNdnMbzBm+Jr7y1ebFsGuIknUh2YIuGm4gRCwbxNQ3SJ1/RiQP30kOoVmHLZXtcvLgbhgCuQ1VnxwWSeye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lTaVXfNi; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lTaVXfNi"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66c05fb27e4so3074828a12.2
        for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 00:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806822; x=1776411622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRX6BcXCk5F+FCLA9LCH0VsqPR+RFElb0bC7cHHOd3Q=;
        b=lTaVXfNi43hwgps480WK0yRwWJJa9uKJW8qzbEyMQBm/ZGGyQfMEyvT7sAzCi0ZLPu
         wGyUy/REAvPwnlCCkd7qPIpuBXxerkbbKbxwBW+3GZTSPFfuND5cR0RbeFVSArNLzitu
         /14Dr0RebizlLtrwNVlsn1zjbJG6yyNtave+e6Jo4IzwBgewYDsEvTFclVcRsRiRVD4T
         +3zFByWV+J6sFKE8deMZ9mcUnvoF8aFuG9Jqs61sVNXACFzTdaC3QZjYeudK1p1M903I
         ma0zCE31MeRKzzx24S/FKcWrFlxiSX39IWE6A9vIwrtneO3aFJFF7TxNUgAI0jL9vaKH
         3+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806822; x=1776411622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZRX6BcXCk5F+FCLA9LCH0VsqPR+RFElb0bC7cHHOd3Q=;
        b=bYR+uG8f00t1s48xlysPrdrwZpNXw3qu+K+rFHUNZHqsUwqa7JcKFxcusGXpoQYlMm
         npXI7diINfZur2pagEIJyYtqgT6QXD3tTGSZ5BaT16nswtfZ3evpBPvAO5Y3ZRybD2cz
         4iFSg86/9ru9JTRrCeLnJmVQYh3irLtbyTtjbbyzFDZqmRfMvXjkxvz/YOvd6Q/R78A4
         8hhabcLP1BvjVlzczC8EYoBfsoLkyfLs19byPSaUe/lOSFxH8iiIh/asqjPRpaBPv9vY
         aHtrungfhWQFsgNXAoMn4LRfzR+WB34fuW0G6cVRoNjcyw1MPYEsR6A0UrcFQixF6/Ko
         ceOw==
X-Forwarded-Encrypted: i=1; AJvYcCXWRXxpyW7dAjp5arPEvByzEINZ55H85X+eCabcxiqAf5fVhapDhuUi8fIx4/nGA9lqUORtOcn5XH64RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyadQqQDOuV7/NdF02sUIoJqwg0E482B41mYHfvKcKzsjzqyd7P
	5iQ87wmajTOa1WB8t0xpGJ9Fp7f5ag45AFA0mxY+jxBUIzKnwXcsbMW/DAToUx1B9OQ=
X-Gm-Gg: AeBDietQy9CZY5TtZsklpefSwViCKTMVcSSlK/DwA98QmagrXs2zdwIzjK57J93ltdq
	lyIf1R89osGR5l5wEDddWdWxBUF3kyV1XtzF2huKYZ271k9kDMj1o3Vf0H8bT21S404pHkFersV
	rmI+opnxmFquRmIQT91AQR99skrbFrXzWogFxj9OzCgd0rbABQ6g4TuqzrfejiLzcGJzLCnRK7x
	H4Xvc+1rbM7pdYN3zKOFWzTOtGMeMPvrn38yvy4+Ri6Gze+wUG4SC5ZTBatqdDenhL9zglwL0hB
	DPsXoXfheVNeQDrXzZRswRoP129kqT/pTUe6GqKmRh5mCO5MRAd9YHit9h7/cZZli0vJjhDiLTY
	/RS4wEXwANHPOeKvQMEk4TkHZtK3q8viy9RKIwL2WqQet/H1KHc+pi7ADxkena1yuelpW6ZtsNg
	QGuUAouVOF3ybiZMapIPQrvREkOGrcl+Lji6Y4CS5G/qHj8JcMLaqYL3+QBkB24kc2FMnJCHtzb
	37nCaipKZj5Zbeo
X-Received: by 2002:a05:6402:2486:b0:66f:9480:c1e6 with SMTP id 4fb4d7f45d1cf-6707b1066d4mr850626a12.26.1775806821580;
        Fri, 10 Apr 2026 00:40:21 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815a1dsm400310a12.22.2026.04.10.00.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:40:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 09:40:07 +0200
Subject: [PATCH net-next v2 1/2] dt-bindings: net: qcom,ipa: add Milos
 compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-ipa-v5-2-v2-1-778422a05060@fairphone.com>
References: <20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com>
In-Reply-To: <20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806819; l=769;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=y7kF1wWPK+6FLzptGcrgDYcOJoYLZeLuaC+ADv6HIu4=;
 b=aZP3u9u4aF/aWtgstnRFKd1QY1+rp53fkEgNZq0mSVHNE8yfSTsbH43s+yGXWMRCEHxhU8h6g
 iVCA+OBQwlRDn2JtYK5XKW3+D1YJw+fF7dxECHyHVhmNzIeL192zbYY
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the Milos SoC, which uses IPA v5.2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index e4bb627e1757..fdeaa81b9645 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -44,6 +44,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,milos-ipa
           - qcom,msm8998-ipa
           - qcom,sc7180-ipa
           - qcom,sc7280-ipa

-- 
2.53.0

