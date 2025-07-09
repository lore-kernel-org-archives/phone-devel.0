Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39899284B49
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052727; cv=none; b=G/QgCzkDq9ejOkNlLJNvSiT7S9cUtcNarqrwL71GdZTNsUbUUcMFZDoPjaRyI+68IN/COBBZUscKkY9qbjQIczi59rQMQMFQd2ccUsZ4ZoXVNb11WBTvYhT+E9yI9q76sZBp2fp8LGd30Y8qAPsD51g0XIWw3pBBMwoW3FBh4Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052727; c=relaxed/simple;
	bh=7JJoxQwx+4/wfRhr6BUnD92Rt+QxpRRv67tdCjuoJ3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJ6aFzA9DkMHDdtnbFFS9Ys+iTto2mIhyBcPMhgIJFVyyGi+0a4U8vD9KgafNf65PAoMf6l8HEeOGE+2f7RXaFHg8l4fbCFk4Arla8v6P1kKXVsFHRMp9y09/vvoR4xnzT/RaPDOKj7X5ESbY4AjE4DjeT5FcrMu6LrYP6uzXcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WkMktpap; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WkMktpap"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso161578466b.0
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752052723; x=1752657523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtyDxcaqf+W6rW1o4o1i13PWl3ydZ1ok9YquBu8um3Q=;
        b=WkMktpaptbkQiclgmBkddw6afxQXm1IZuxPDIGHC+Mkykq1l8d1si5novmawXmXP1a
         VpDihgpCJyC2Cl1R5subZPqGplDLDE1zxmByQOOpbFZk3H/aRqbRqzDluCYywL2ibOIM
         2Y9KdWPZ7Ts0jqrTda5NzdhMUdq1rTRDoTCqPlRQJjCLgASCA18XbQtlVJVDir3KEdMd
         uTwwcPPTOoCY6yT2E8+8iougRjx4bn/TzA+wqMXSB9gs1UwcMvzWPL0CarFyyLudnhyb
         4f7WMHxQNqwu8toWwbdPx6+O9S6KVu4Prl+X5YpnT+DAtbYVwYLFgh+GSqoiOPKbZxOh
         aAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052723; x=1752657523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtyDxcaqf+W6rW1o4o1i13PWl3ydZ1ok9YquBu8um3Q=;
        b=JgOg2GGD8rUcEwa4A7YXJuXaf74GcO81KHFcFP3t4siQG3eQqkimYZdLmNh2Ac8Cn6
         v7CIq5ZQsLohKj94mPRRCVOt93BkOihw0cR5TYbqpyp/JuBR18tAbAZkAU1m+NXLcS7a
         yvcCF/jvlOFN7gYrPlrAiGQk0xVBiR/0HRnetaWUQXTZ3eNSqDH0D2i/Nbknnintob4z
         IzV06Nw/J+a/UPVc1ehKIkj+DpfxSqD4qmp36pkULnYJSIoSspmtrvSC11W0KQ1kXrVt
         g0SoUg/djGu97nFJ3Iz8y2wmkHyF9u+/9iAeiODoQjAsPcMS2dij02RXtnSb4JSdnkpj
         pLyw==
X-Forwarded-Encrypted: i=1; AJvYcCUN4IHynGblmnutt30hqvSrV1k7DLreVfrIAxjy5tVPqNITgvWhtglZsAaH/KT+nq5ypz9rOmtcfd7/pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHhn/mJCHW8O/6CQH6OnPKscfN9Lc2KwsqrRbUc/9rotiKIwa8
	u2nxD+b7V2K0CfpG6K/cjf7vRa+2d0OZavpzTND6SH9G4Z289MKWw4HuDplQC2SfDcQ=
X-Gm-Gg: ASbGncsfddbCSxmsHJbAWudyBEb+bGJFmouvAi7mnKpXjOZ7uFT6zFvLHjgnL1eBXlk
	ky3V3g8dVnOT1O0CbZjTnYmuItZJJs9ZttDURXlN1wtzLQ2RIaYLqoA0Qupo5u0jdefRVh2ZTk5
	Vp80Tq9dl6BCjtWl8aQJ8IAKtZdVdqhqjdYSuJjY5D0smFgv4OSKoAUjvGUb/ZOBvZiMoZ3xXoK
	H7DycBXbdaUtVt0Gu4kElWVpbin8ykYZuGWOSN5ynUEjyzOAzHjK6EKsK23dv1GdusMtGJh+TNM
	loO95pmca2Rvd0qQA7Yvuh+B9zSG3rPnqep29P7I5WJp7Upk4SIqN4wEs4DYxgbRJh/gHnVyHk8
	vfxQAUeRwjdnEzU4GiDpkGxvwt76njeog
X-Google-Smtp-Source: AGHT+IFjTub1n0rD6n3C//VfI0DUfJzgzG0dPyTmQDEg3WymTFqbXYGq9le/+InO8pAn1caBoGUS2g==
X-Received: by 2002:a17:907:6029:b0:ae0:a7a1:593c with SMTP id a640c23a62f3a-ae6b2721112mr451588566b.25.1752052723357;
        Wed, 09 Jul 2025 02:18:43 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e737sm1060116866b.142.2025.07.09.02.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:18:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 11:18:16 +0200
Subject: [PATCH v2 2/4] dt-bindings: phy: qcom,snps-eusb2: document the
 Milos Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-phy-v2-2-4790eeee7ae0@fairphone.com>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
In-Reply-To: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752052719; l=906;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=7JJoxQwx+4/wfRhr6BUnD92Rt+QxpRRv67tdCjuoJ3o=;
 b=oqiJgUa+pEZRn08K3xP+dwnnlVdD43KZEv90EWs1Nrv4/EhFmjFjk3Ol3Z2ZY5J0FzMl9SErh
 Br1G8yHy40UB4v66KWr2gkRj2YnN84GLBloqxJIe/DNzop3jd8tCHDK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Synopsys eUSB2 PHY on the Milos SoC by using the SM8550 as
fallback.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 142b3c8839d62d91377061ade3a7c400eb970609..854f70af0a6c1ff93615fa8dc1031b4c1ecc2e71 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,milos-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy

-- 
2.50.0

