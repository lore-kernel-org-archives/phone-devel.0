Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02621B415C
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684905; cv=none; b=gzsOb/oK9EhC1aZgm7CN1MOAbKJ1m0r+cU7H40fAxF/AWITaFsZhJzbFZUqQ7EhAI3PQT7z9QyAW7CSZVFbgyXLDduuSKVKuihyCMV6gWXN8xeEsTi1e5mO2frEz2Tq+F51q36oh6laiqbwkulN99YxxUNqUXxYGcNpAVFMcZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684905; c=relaxed/simple;
	bh=RBDW6pIiESDvWThJlMdAfXLNct165Bn4CNYmU057wrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PeKUfI0WnS8/MOu9e2EmpbeT2bPYBOb1vUA9y7t1RqmDEIyGwOhHl8iWTBWae+pmUAjoT6Dm64vnW2R8+KRGJctb4LifjGg6f3U+1SDVtBFnS6y1EW9yOgh0Ukdko2Mu3gWQv5rgJ+XEQ+3jBhB49G6un+IUH3bFuvEq4/lkZvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DLtSAN0o; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DLtSAN0o"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436341f575fso17473365e9.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 00:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734684902; x=1735289702; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x4bX0y1U2uj3LXkaRKY3Bj+bT7kkfpgx6oJ7MVuwDAg=;
        b=DLtSAN0oFwmLXoI+MeSlyJCDC0zBvYGMKrqqOaUvAF9bItzelRb2Bc4OcNw4F3HsQW
         caoHIMWEz5UMjjM+18T7JYuuQpMJ1dN8VEmnkCV8N3roHRXGGsSJIbcdGq7uJ49TI1En
         ohAim1KGFhKDmuolyLA3MVXiUsXocmLo/2QCR+Sj43BcpaXFC7OZTUtIgwIsE8jEk3G1
         DKJCeHQIFGfjSpNkosWQcLGgm1OtH7Qtpcnczw5i0o3IE9qgm1aZC/tD4p6G443Ng9k4
         dTYhnJ2fcBxVL9hzNfRv7VDIQvahL0GkHOTQ1aKZYELLyfHSyQS8BWwLhMmxS9gcwciD
         aMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734684902; x=1735289702;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4bX0y1U2uj3LXkaRKY3Bj+bT7kkfpgx6oJ7MVuwDAg=;
        b=g5qmKrFHBWu3KkOGuUYl4/jnZQBCCdhX+vH/Htn5KQzIoEVQ8IFc3ez9MwvQmrw5N4
         FhXakJEcFAkVfBptPoqOpfcynoLenGyCFVP42exzkKpfU1FtlIgQdHyoykhUbeJXfM7k
         iFRCIV4TxIb48HWDVuoNG23GeMR/7/zqdU8ZUqtO1UZRDN2c3VQeRPydeFJAkurlUkAE
         Dad5rJb3SuP/QO9KJ7/veH33lJwxdX9cuaoJarctFVbpKWoWGclTHIPBtjBrEJclx/tp
         +JOxxFw2QoyFRMzPOyqPiW7qGUweLS4coYqs7hGuwjffXBQskKTd6tvt9I8q1fNEN5LL
         1mNw==
X-Forwarded-Encrypted: i=1; AJvYcCXBFMtLW8sGMoCtks0j41+JVCz9GNc0kqH1GWsOZDVf2E5BwoHZFkQhlBTUsGbmgNB28Tjlhu2fZ93ydg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXk0F85r8ReLyP4tu4/OGCkpisT1JsM9oBk7P9iSPgs0TkXyqq
	jbbB4bWxE/K3VEkyXDsxN5dJpRnEJeXjB1Lf+yvuzL4DWh9o9pN6TPdN3C+ZqSoBoQpQ/a2HFD2
	Xb9s=
X-Gm-Gg: ASbGncuXlJmL3dyJxETUTpQZO2XqAoYuINqiDuJSZ/asfmnUXHyYyUqwJpWxZ8nWb6F
	oMBf70eguubVDksA9ez6AosYpqEIK+HkxCxxj5nNmgs66b4ARLetzSA+CZiqInM7rt/RJtS2JVQ
	deBcSXDOdOO2HQekpaSMvYqlw36wzmguYqL1HapcIm8QgFzV6BLYLFZaY9yU03zEQVlCg+o09Ju
	VNTPkU23HOKMMA0C6IuAdn7bAOa9qbn5Ux1j79fL52uha+UBwYwf62fRdOL02c12QGMiWMhH8OT
	uXDDqseRgoYYTmdO8D1Y4o66TAah3w==
X-Google-Smtp-Source: AGHT+IEYiNsrQEZYY/R6oX1gs6boqSiZAfgrH8ynuQCvryGC8V4E5T2j2oWTo6VitrE0P5xEju9nDA==
X-Received: by 2002:a05:600c:450b:b0:434:f586:7520 with SMTP id 5b1f17b1804b1-4366835c3a3mr14506175e9.6.1734684901944;
        Fri, 20 Dec 2024 00:55:01 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661200abesm39815225e9.18.2024.12.20.00.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 00:55:01 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Dec 2024 09:55:01 +0100
Subject: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Drop extra
 qcom,msm-id value
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-fp4-msm-id-v1-1-2b75af02032a@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAOQwZWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyMD3bQCE93c4lygsG6yublpmpmFmYFJUpoSUENBUWpaZgXYsOjY2lo
 AyFQXelwAAAA=
X-Change-ID: 20241220-fp4-msm-id-c775f68604bf
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

The ID 434 is for SM6350 while 459 is for SM7225. Fairphone 4 is only
SM7225, so drop the unused 434 entry.

Fixes: 4cbea668767d ("arm64: dts: qcom: sm7225: Add device tree for Fairphone 4")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Completely dropping these values also appears to work when using
boot.img header version 2, but doing this change now would mean any
tooling in the wild for packaging up the boot.img using header v0 would
stop producing working without adjusting that mkbootimg invocation.
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 2ee2561b57b1d6c7b0f40c93de62df47faaf95ca..52b16a4fdc43212e1ca1986361b01f47d36445d0 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -32,7 +32,7 @@ / {
 	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <434 0x10000>, <459 0x10000>;
+	qcom,msm-id = <459 0x10000>;
 	qcom,board-id = <8 32>;
 
 	aliases {

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241220-fp4-msm-id-c775f68604bf

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

