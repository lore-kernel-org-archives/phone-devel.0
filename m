Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAC3315D40
	for <phone-devel@vger.kernel.org>; Fri,  9 Jan 2026 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767971686; cv=none; b=ZUv6n6IS6x87d+AEz71bb6ObFtP9qfnF22ciS1NfIZGeb0U5MvajX2SuEtlIHugHXY0URrsr+lglNhzNRLoYiA3cfQbHiw8fcjCmHvuYei4cBrD3FqMHukqsq3xi9aGpVcAI6NV+yLgC92qAMfco+CEcRukmbDtq7ESg7jmZGWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767971686; c=relaxed/simple;
	bh=3wJw3C/+hh4NQMeHHX68eyDgMfZwVmWs26kYc8+dwvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T/DLfJQfd+/dbzn4QWbCHb0NzORh3eECvv4VG7js/QRbzkVmRQ/txy6NE+PG18jbIaegAubmmjzZUAa1A1leBVDV7gBJqeQnAazWLZ6uWdA0FvDv3nIA5ETirAOPi4pkxIVFyw86KY2Uk1F3COhvYVVnsmnDZ6OMmUCME5zx54U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AbwCjr0q; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AbwCjr0q"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso8932768a12.1
        for <phone-devel@vger.kernel.org>; Fri, 09 Jan 2026 07:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767971681; x=1768576481; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vzsN76gbuzfMHxHnC7MWTahrr4LZDPF4d6JCQ9x6L60=;
        b=AbwCjr0qE8snxBIpfYofa4Vf5XzgmPfMfSiqqfplMSsbzVXkubaCKs1Gow1xFhdHn1
         qZ2kdmySTLVzjssMKSOVEgTS5BcC+Q14DwgHgx6j+6xswuB+vTne5SnAEM8EjaWbh3wi
         Q8j9TWv7p0wL+IHkHo0GuiVKyYCK/lQIsv7Zcp60zKOaAJajL6kMzlHar90CnZN8lAqy
         MqlUrfNUFpA41Z01KLStfxvumdRQMND1FfpIOufv8QpdIq8ZAQNcJwLz8s3MaAu24AFR
         Nwe2IcfqPQUENn0kP6WwXvcj0CZeh2AoOri9lNmIq7aY95Jshfw5jvE17Xb50ljhFGFI
         aIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767971681; x=1768576481;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzsN76gbuzfMHxHnC7MWTahrr4LZDPF4d6JCQ9x6L60=;
        b=lTJ9QURgBDp0jKO8x+hJil536hBM1nGpEXQwLZ6rWIM3IkNFVeEPasLu6S6e8W4YW7
         clyOjJAsxalLwU9Ks1AD6Fbb+XBxJW0+tiBRfayNnKUc2CVNDKFTLcoP43R938VnbZS/
         YjiC+8vGFOG9peXh79YrIjqCndraDE1/SN4jDv3HCM+XPE0S/wWrngBgUtzk8lociLA9
         pO7P2GFxWxUZO9HmxWvdpVxoATjSLtAF+GBrmn8/mzIMV5kb8/jTIGLbrjwFURHBnfxQ
         S14eE4jcSMjWl7askvUsvUYimx0QCpMFVjA+SDlhZVzPOu0UZ5PJhtja+QLh4xaws+wu
         0Jaw==
X-Forwarded-Encrypted: i=1; AJvYcCXPWnp/rtO14VbBMiEfdMcKspKYeOAx3t/1SXBfyAGy78TP6NMrID9T+LQAtTtDLoJzYho5iU0S4SQK9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv5fPwprQHla+hgRrNRIfCvf7oC1iIgdnRp8JCefEnnq2AM+EH
	b1nJdM+WKcOgoy8fRc9PVlC7s4wz7csqIzMdcc684WYTaxdXfaC4Ab/BlavM9HpBTOI=
X-Gm-Gg: AY/fxX6An1yVY7J91b/dn1o9gRGicVGt3lHOoLuCsgKQ+6Nk1Iipa0ursOv+o2gozJO
	eZSZ1vb73ALf81rKKnZAn/D2Opea4FIxT45GiJH9p7TfA+AEnQeMd/V806T16eQGleXqVdsiluT
	x7yvSIk8mnB/n5X64QQ4FEFsQXCdM2ZgU0lCMwePoyXG4MEpuu0N6x9TwTcm2tPdVgMAfQVz0s9
	BSJ4LpfXNVecSxJ8XiwuHUBES7MBlYDqN5CTYI2FT0DssmVUDPPXtjOIJiOMhCUbS1sRMmGF+qH
	9PO1a67y8HMVIF3nskCoKgHlheoovAdyd29U6nBZDT3qbSLubu0OwE7y/REZqQNy09+pswl4EC/
	JQWEeUGRCaItx0QTqj/haAJiiGAPkvfCTY/Mpm3MUJ5MIo37B/3/NBBk0bsCewctt5kmE88HafA
	GQcgwKurBSKCadab3TA4OqZfzzrnE/vSwuwN5j1rZZDRroJaKiOvtfiS1WxmXGSLAhPfpnCrWL3
	h0=
X-Google-Smtp-Source: AGHT+IEWXRBm5Yt+mRPm4TDFGhALAHUKOfO9MZDpvsMN2Ad6i/iMOL07Iv/Bnx4RypeMPrSqbNgVFQ==
X-Received: by 2002:a05:6402:35c4:b0:64c:584c:556c with SMTP id 4fb4d7f45d1cf-65097e733c9mr9290437a12.30.1767971681192;
        Fri, 09 Jan 2026 07:14:41 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d4c89sm10100742a12.10.2026.01.09.07.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:14:40 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Jan 2026 16:14:34 +0100
Subject: [PATCH] arm64: dts: qcom: kodiak: Add missing clock votes for
 lpass_tlmm
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-kodiak-lpass-tlmm-clocks-v1-1-746112687772@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAFkbYWkC/y2NQQqDMBBFrxJm3YEoVqlXKS7SZGwHTWIzsQji3
 Rtql+/Df28HocQk0KsdEn1YOIYC1UWBfZnwJGRXGGpdt7rSN5yiYzPhvBgRzLP3aOdoJ8HOmaa
 9ukaTGaHcl0Qjbz/1fTg50XsthXyO8DBCaKP3nHsVaMv4r3QwHMcX4nQeZpsAAAA=
X-Change-ID: 20260109-kodiak-lpass-tlmm-clocks-7da465d40eaf
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767971680; l=2691;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3wJw3C/+hh4NQMeHHX68eyDgMfZwVmWs26kYc8+dwvw=;
 b=6gzuUyvGJu+bIp9v+03BDrHW7vD+Umn5JYZov1W5Sz3HUmUSaapFRseeqLaQVkty++r4o7Dtq
 8VBN5MFKJosB6zBg+vm9c+6TMN+cN08Gp5qVYhmKRuQL80QCz5Ymvix
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Without the correct clock votes set, we may be hitting a synchronous
external abort error when touching the lpi registers.

  Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
  <...>
  Call trace:
   lpi_gpio_read.isra.0+0x2c/0x58 (P)
   pinmux_enable_setting+0x218/0x300
   pinctrl_commit_state+0xb0/0x280
   pinctrl_select_state+0x28/0x48
   pinctrl_bind_pins+0x1f4/0x2a0
   really_probe+0x64/0x3a8

Add the clocks to fix that.

Platforms with this SoC using AudioReach won't be impacted due to
qcs6490-audioreach.dtsi already setting clocks & clock-names for
q6prmcc. The sc7280-chrome-common.dtsi has also been adjusted to keep
the behavior the same as they also do not use Elite with q6afecc.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
This issue is somewhat of a race condition, with some kernel configs it
cannot (easily) be triggered, with others relatively reliably but it
seems also to be somewhat related to cold boot.

Also I can't pinpoint a good Fixes tag, lpass_tlmm was introduced before
q6afecc got added for this SoC, and that worked fine for those boards it
seems. It's just needed on boards with Elite audio architecture.
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 076069f14495..f478c5e1d2d5 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2994,6 +2994,11 @@ lpass_tlmm: pinctrl@33c0000 {
 			compatible = "qcom,sc7280-lpass-lpi-pinctrl";
 			reg = <0 0x033c0000 0x0 0x20000>,
 				<0 0x03550000 0x0 0x10000>;
+
+			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&lpass_tlmm 0 0 15>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 84c6d662b54f..617a39d32488 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -67,6 +67,11 @@ &lpass_hm {
 	status = "okay";
 };
 
+&lpass_tlmm {
+	/delete-property/ clocks;
+	/delete-property/ clock-names;
+};
+
 &lpasscc {
 	status = "okay";
 };

---
base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
change-id: 20260109-kodiak-lpass-tlmm-clocks-7da465d40eaf

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

