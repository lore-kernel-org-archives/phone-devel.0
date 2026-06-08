Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056E13C061C
	for <phone-devel@vger.kernel.org>; Mon,  8 Jun 2026 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928939; cv=none; b=tzOMd1uhBnst3RrE9NkePyVBM/5R1IuLRcTP3n3AMvFPdEjnnMVTk3/fmPBVJGqv5K/Izw+8UqHQDBUbhBL4xt29GAp9SypXgvZxdvwbElRntV3yX6EO3PNgjkWXxIl/S/khfGGjpVAn/zfXg6gXz5ZYWlMaPhZgn97rSL4yTjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928939; c=relaxed/simple;
	bh=luqgOD4RGbZf7aivTx5OKHrey1l1rG2sZFjtaq982Wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B+1dPlEe/5A1NTjzXzW5+8KoS7EP8txJcpExx+UDrBbtDmo72jo+y+8E8ibJ2EGcRxevyng2Qrc7dHXRv4G4Jtc8r2k7Ep9SLtMeFAdXUOVGVYw3GwbD+nM27I9eAXqPsij2CxLQXWkCPoTQbMEE6pSrzpX0fmTkTsSljA11N7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfnFSW7V; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfnFSW7V"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef4223be7so2317398f8f.2
        for <phone-devel@vger.kernel.org>; Mon, 08 Jun 2026 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780928936; x=1781533736; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vOtt259AiIcPipuJsaJ8iKxiDpMZGY8IewGo7CSvhw8=;
        b=OfnFSW7VxjnLvECEbgULkwll4qRgY+Xex43E+BbQiDh4vkc7E1kk9c3cbcW8N7LLeO
         FGflqSlfeoit4nlPLKzX1xbC4DnussLjVPwJR5tsvRigk7K4XyKsOFSCiRjQpq/slKdG
         S1TAELKKRFQtejYm+XTuNZ1nrKmGPI3PAq5uBpP7At81U/Ubc3N9i7DytaA2LJ4MsItQ
         A9cSM+UeiUbqQVQNIjQYHYV0JYeMqEyIDweq/Dq/rAr06OGVvHHbv2zl+XaU8+Cl9FFO
         Pn+ciWhXA6vII1odh9KT5i90MBhqsF+fuIpnITTY/pmzI/aV4gj3FJ4lKtRwBRAqgETx
         XsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928936; x=1781533736;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOtt259AiIcPipuJsaJ8iKxiDpMZGY8IewGo7CSvhw8=;
        b=FwP6LLqQZfIr6WjopluYR7N844kpxPHZ6KLyG9zPzFBSTlrE4k74mJhwEctuW1utGS
         KA2jAT4VLbqUKGWoOwQEeGrLr5Y68GlifxXrlXNLoN9ZaWvWM+skvLbJQb/CiUsSNQ94
         iwWn6QXp0irKoP2Xrl5p+I0YhZmFdcDPuAlhoFPs3d0DIng1JuywwQc1muI2UpzBpIHN
         t+tJhlLCvNsN28YCV4utbcW5Wq2GOuVjh0Oti0+6nucm/iezS+R9yBIlqDhvlNMrn6+8
         3YeHp7RzDjyksL54soITLKu+lBK9J3hStVzNQmxqbdezVgY6OFPSMvbW7Ajl8TmxGghX
         XSEw==
X-Forwarded-Encrypted: i=1; AFNElJ9dBEzyc+GiykOpZCcI5Az8sCpXOER8PouOCc2K0JjzcQR6JtsYd/uLsnwah2T9O+nH64UZkNDUNyr0xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkhcJEapnGQ5oLpBFVknTco8dpeg50Jeh+ktyRtDdcOtD9b4HZ
	0GiFRIPG0meX85LNzKr5f1Rvoy3kXRvEEAO+O7JDxC4Y+9ujLz0wgR23
X-Gm-Gg: Acq92OHYKJ/yUATa6VFCyaaScCxq0VPuOO0I8Yv3WH5b+3ENIXl45QKYmGsVM0Tz88v
	h8z9PKpHOaee92qiyxetBL3LyL5M6osjELXpRkI6PkAgT0g7C0tWFoyrihYxg2Lp7ai9u7Zlg0S
	cAxPrdX32PxaJ8XLroahKbmjSxk7QC6O1+8ZixOh6MARXPlF3FdNNDtR+3zIxloDGtr5EWGe/oH
	Qg9/0OjPLydI5oZy350bjZf6LAc0GRDSWS7WCKNSX3Qk5isDVwbza4yh6KBurI7IODH+tyzyz9Z
	eQup7m/BvS0+oDwHK6O0toPOWPZoiOPPdMGE0GiJ9g8BU4VscNgEVi0sGuXgvuj49k6/TXvN7C7
	1bw8A0BinjxxWQOhEPubyprDo/oG5lOMc9rubOBr7dekqRJF77YpumDda5JM6W5g0kLVi6SyVoo
	PP0ZvVyu92kR83jkFf7S37GHz+ypn6Ndlraz8YCgk+vRfWnPM2dwlh2OjI7L6cbWKHgVapDRF2E
	8px
X-Received: by 2002:a05:6000:181a:b0:45d:817c:b8b2 with SMTP id ffacd0b85a97d-4603065b5f2mr17122343f8f.30.1780928936383;
        Mon, 08 Jun 2026 07:28:56 -0700 (PDT)
Received: from [10.100.102.82] (46-116-185-113.bb.netvision.net.il. [46.116.185.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm52065463f8f.26.2026.06.08.07.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:28:55 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 08 Jun 2026 17:28:37 +0300
Subject: [PATCH] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup panel
 compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-b4-compatible-s6e8fc0-fixup-v1-1-303606b53c1a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQBDvYXqV0kcRRp7QaMiqCe
 HfTdvn48HdQzsIK92qHzKuoTGOBvVQQBz/2jNIWgzOODJkGQ41x+iQ/S3gzKnHTRYOdbEtCss5
 T667+Zmsoh5S5hN/98fxbl/DiOH+XcBwnNzXXZH8AAAA=
X-Change-ID: 20260608-b4-compatible-s6e8fc0-fixup-612a6d25a914
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780928934; l=1089;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=luqgOD4RGbZf7aivTx5OKHrey1l1rG2sZFjtaq982Wo=;
 b=qmgM/DS7uv19nRKNxCGl5Nx9UryyEW2/g1jYt2EP4xTHuC9SChsGmIyERekvMHFsfVJ7DSkpu
 JxEtfuSiV7lDuy5Si0ME2cMWfC1ObKV/8m/aK5Cr+feUeO2rXJa/Ang
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

The change to the panel compatible was missed, fix it. This compatible is
already in the driver.

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Link: https://lore.kernel.org/all/CAHuF_ZpTvYmARzx2_be1foM6XUVCdE0bNmb+YcHkH7tFhrYF8w@mail.gmail.com/
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index b9d9439e230b..139f2b401af5 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -198,7 +198,7 @@ &mdss_dsi0 {
 	status = "okay";
 
 	panel@0 {
-		compatible = "samsung,s6e8fco-m1906f9";
+		compatible = "samsung,s6e8fc0-m1906f9";
 		reg = <0>;
 
 		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;

---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260608-b4-compatible-s6e8fc0-fixup-612a6d25a914

Best regards,
--  
Yedaya Katsman <yedaya.ka@gmail.com>

