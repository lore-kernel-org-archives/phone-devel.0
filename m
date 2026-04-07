Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69B035F5F7
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574687; cv=none; b=AXMjVS2OORV+OVaZP8JJFyTppcNmAdq1qAvNTi9oy+I926KxtHwljgZXp0j3gRpBU+CS/mJCAao+iZkjkl1a7Hu10mjnUNSHeX+VlzMWJzBEUQSP0shF/mzuNCHSIZ6oJQjBDsv2w5VxVcJXeb0pNYBwj7arWi29N7E7QjiOxko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574687; c=relaxed/simple;
	bh=dnRmxr57u949ztN+0PPrL3MrbjbDkkYTKjLXyIKICE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLU/UttvgGsNLKJagV5a1zNMGXASRXiwBufwLAxxTMPVZCUn+PeElHCNZegdfMJY02e+ONJmRCcW5eaBXn1b1b3SgRzlmmHQNiaA8X0g2cmjC89ZOwWg89iJqaZgaszW4Pq3NLUMgh+ZZ2Rga0BvBgAtozMpSiYe11f5ZRWnRDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qFL8tQjA; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qFL8tQjA"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66f7e34bbd9so267322a12.3
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 08:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775574684; x=1776179484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEaHzs3NqdSvzTjZlDwUeGkd7KV4X9H8nS68JNmSi4E=;
        b=qFL8tQjA6D19LR10STywWC1LW62pC8LTzRm//7M+yGzqNjvfTKgTo5UmSkBPk1QQzc
         Dg4VKkC7klcYeXNSL2BNgOS3/mQ00WXiuOFiAGwQm7aGMXLrgMbzHPytwmuq6OWawIpk
         kkpaT05U/pUqCGHVXfgyIlmUdM2SSBEFiNT9AtHwZ20khP9vgV9EQfCmwXLR3Q1tLr42
         83QwgCTscwU7tWUTFVTyIsGRSxNgZKvOn4LqThGnR8xI8yaUuwvkmEt1v/K+hFjDNc4D
         B3HKXSUdzOpWbiMgPsK5RmQ462mfCrsjMt0+iqBLaSl8OZaJHX8JkEKXrL8fe2aoOEZn
         v+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574684; x=1776179484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEaHzs3NqdSvzTjZlDwUeGkd7KV4X9H8nS68JNmSi4E=;
        b=ifALhiPcOf2udP2pIFEXfx526YkadN9rfxsY3rUdXHztLYpBANXTrC8D1j0d4kl7Ny
         5ZKDPxbdMlQSuuboZPr9yY+7mVZ6dC40U/LJZ6euTwuURPIcDLoDBTSqjN0zAw8BhQ4N
         Tnjw+hgRa1nUPiyeTFpf4JHl5N6mufd5dbFe6fR9vgJMxbcsrOHMBTM2bCSesTsb5p9S
         tHzTeDmBSgjT3STzs3QQZfUb4bMdCI0kRIfgcYFnfJKXLtwiup0Y3HWa2P1T2vN6yVOG
         wZcoMHF7hkZwJgryoDBCHfd3+ZY3vyg61YosKQF+v2S4L7IUgkrgoaRsie+O21o8HSX/
         aRGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdrRyAWyyMTfj/7lrlhbRc6SutCFbi4j73N7BfHmqU45vslYjEKu0LJOZraTeqt8DYoUiOMpOBL77+7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqF69ZQpfe5uzSgH2lgQS58vslABagubxqzBJTy6G+9jz6+KfP
	JG7fCmA8GPQrxdIrNot9GXAiMZAp9ZLLnvj5XERR9P04gnMWSIfQPMeJLCy80EoXRl+JhiwR9Ox
	dpb4xrs8=
X-Gm-Gg: AeBDietF27/dqaOeGe8UYJQZPDlgZwNU+BDJ5jY3BRchMDvmXytTHvZ1jOeIJUp5Ep/
	Kddh9YWHNGmSVZqZlfNEdDLlDKm4BubNNGSocYbdbsv13FxUFTMIFU335pZsemTGif7cHEqwTyp
	osLpJlupTRkSsgBOwfmzmzM4R2D2amjnMXq+Cv5nwuUJvsft8cqclIihrswAT8X59HzDn7hJNrA
	phqN4kYuUHX0BTiGM/lBISfrv6zgcNHmKp35B3LvuT0mu4BTZR6Zjb5lDY3bx9W16hUR0lMsP4q
	r0APnEgXQWqft682MYnbnFclDy/1T1PUlAmyi5W4GrLo9hHETprYP6z5qzuiWr7wd6NrXCu3DxJ
	U3Msrm2Dn3mxwqBvF9q4MAXBzOt+EqYU389yAEMwTY9/62KHh00bZ82rG+6iWCtapP4XeCFXhdJ
	CLar41dCsdeZ53rBmsnu+uYZLvGBRUEAMeiUZwmDm4IxdfVEYH3QPmenEdYNw9lZwztL5vdu2iz
	s4QankFE54WznKX
X-Received: by 2002:a05:6402:5107:b0:66a:526b:96a7 with SMTP id 4fb4d7f45d1cf-66e3f707a81mr7719262a12.19.1775574684279;
        Tue, 07 Apr 2026 08:11:24 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e6f10834asm2753326a12.15.2026.04.07.08.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:11:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 07 Apr 2026 17:11:10 +0200
Subject: [PATCH v2 1/2] dt-bindings: sram: Document qcom,milos-imem
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-milos-imem-v2-1-5084a490340c@fairphone.com>
References: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
In-Reply-To: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775574682; l=701;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=dnRmxr57u949ztN+0PPrL3MrbjbDkkYTKjLXyIKICE8=;
 b=Y3K9a2xbCo8EFcWDCmEQ/ThkGUuBRSGYIsk0SYRlMA/MIV1Yc7LP2irCiLMTv00nU9PdyP4Mq
 MspJ0nOG2wHBDC2ehU0f8YHc2F5c96UIfrPbkGOH8pqbxZDeqDigEh8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add compatible for Milos SoC IMEM.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c8..cb2e11c73d98 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -35,6 +35,7 @@ properties:
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
         - qcom,kaanapali-imem
+        - qcom,milos-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram
 

-- 
2.53.0

