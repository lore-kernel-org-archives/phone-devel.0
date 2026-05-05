Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A10481ABB
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 21:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017581; cv=none; b=WkxcbZj9AaJp8S5dk4QlgoC4AQQGwCgJ1qmi8ry4wOr7JlMtoQTFPYNyJG8qn6Fq08nLx5OqhaIoKOonB86uUn7Z2dxRoqHakFfZEcsCseByCwPdtlUXPz2+EF+PsCdXRzpbuRCmYYiMvW4C3RtKMu+WmXR1kTASUULudwT4a9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017581; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ALhDD/Jfn7ZCpGlLhWbzI8u5J0x0YOm5WTrLsuQgnl6LbAlzncaQiPjevu/p3vzc9IZQmIxADnfPZm+wNrIfSZZmmiNw3aMrRmnX7psGsQd7IdK7kyHlZKPOnePS+gRr+PinpsO1UStVN6/L62NMpGXOw5c8OPiuY01H7Pf150c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNOfQYUG; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNOfQYUG"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64e87a81639so5312376d50.0
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 14:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017579; x=1778622379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=oNOfQYUGlkdShswceSkeqF7C0jATaSb/VNCd4PK1bFq5KhY5U1iEdnZMGRcmyTMpZO
         7badLoPgphqJccfEvdu9C6gAhznj37ZmkO9HM13q0MNYI88Hd2SKlsr8YsiC0SeSsRNS
         Yymz2d0fiTqCMaUUP/bY933ybZ5PXBOV9fAj6kLomlft+NfE2sy29enuDJbsG2Er9MUf
         X/JScuRIZVMk5FOzvkLSqdf4j8ln8WWiPBENYv0uPQNUc7+EI84St5nDGcfyIIfTzuqj
         P4xaXpvDNvdZCTPJrmuMTokK7maru5LdLgeE2smnvpnsuffYTujM15RnGkKY1x9N/v4z
         bUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017579; x=1778622379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=iKO0so+pXSh+BD+0jEIkWfpRIL0AvD3ykoW2D/ju2dR7020BUdFhQjBfYIolMe6brq
         0xdBOvN8X32dLiQOvGEhxkbCDmDflZ2+7MqAPcP9vmcpwOLpBxlN7qo/TOjnLE6JXx3j
         c2JutmIu8HUH45YTJbPgrxvJZJ4JaCMi6s8P6DcgvIw3S/asgpTIx/kfvm9RvayQfaW9
         qp7Uy0wJPQwIBjx/DXk4CzxAMeLAOAtNGOK4u5siTyit5p0u0FbC5I4QFZarFluVmUQq
         lZR8wYDP+b0eGRUPuB/NfhnjXy25LvDcj+GrACZ/2DOtQrcpH71AovF/dbIt6qp5p2bf
         nGhg==
X-Forwarded-Encrypted: i=1; AFNElJ+P5gGHXNMwNMvPmOiUrtP9n+2YERQioQ/7ba2NZObJ9SM+Mj6qgk5JwZ9e8Qe8PqaF0RjEPaxgZdj2bA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeD0NQXWJkIPRCNPO5XviWHYI642PobA5jjak5BDRjlVMchuYa
	skUSHDSvKm1LpM/SZ3I1avzaso3D8Z5ZaAGT8AYO7tjiyp+W6ms4gUtf+a/prA==
X-Gm-Gg: AeBDiesbkZDG4ywKlPICeztnTpEAXrY1ztQBCqWMkFQGiqn04lcTRWddiz88LI/VOZt
	KND4qUp5QKJtDdO+tegW73bUB7ONUjdUmOn0ELUHG0r4ccj17haZab5ZmdCUE1nQPJOx4V40RPB
	ugWhIX43Fx3qTQE3IayRAi8helmFaXTi+ZQ2fXp1ldQ5QNPcKCoByDyXXTXf1hWthFNPoYtzDUC
	htyCcbS5u/uqtCC7OF4Ch9tS5khy6BOCTlIHiNm2muSsV0hx5ICQQlJoC2ucMJpVqoOCU3poSQM
	EhVr1vHsDI1XKggBepAekPYtOFHvb8kvQbLRc27Sp5VOF41XO+rNJ/AWHs//jZYk8d4l25QnfFt
	5IYUT3fChka/idJ8qZXK037GB5NNCEn4/0JXxc1dBHm0SSL2XcXepsfiz6uNN0r7F03g3A7hK55
	5Ze0+NUagHu5SVEiXefPIcQsxq7WufgBrWAqIN
X-Received: by 2002:a05:690c:b9b:b0:7bd:a50c:454c with SMTP id 00721157ae682-7bdf5e032e2mr12769457b3.19.1778017578724;
        Tue, 05 May 2026 14:46:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:43 +0300
Subject: [PATCH v4 6/9] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-6-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

