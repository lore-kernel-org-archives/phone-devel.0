Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E04657C4
	for <phone-devel@vger.kernel.org>; Tue, 19 May 2026 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203634; cv=none; b=qpRULAiFYeNOhDeys61nOiTw2QnY9Wit+lPH8OkSE6YQ437sFabrymF4Et9a+HIEs1siw+g2R/VtjpN4mDz9Xr1kznaaLWrt3QTM7xs9v8mCxGvpVvNkVKmBb4Lbom+ki62uQeNdfAWsbU3DyJ1Q6scmkSZWTKtOfS36YRy1WyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203634; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDW6EmdCaR0y8913rjaStJr6PwF+daVZQ+Gw0BVE/Oo0WoS57VPanIhiP4GyKaCJmO0L73aqYvhgUKO7cpjCtleq4JpUhtdCY0W2yc+zlHM0PdbWrgq3BvFl0FWaYcMcZSmZEZfL6zm0YaATYKgK04jhuJTw+ZkhGNDeOuSvKXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhYHepEj; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhYHepEj"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67b6da5a618so6422724a12.2
        for <phone-devel@vger.kernel.org>; Tue, 19 May 2026 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203630; x=1779808430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=DhYHepEjAME9HAypfjQdpTCctWhHMNRjAyhpQU1/0WqNsdXG1d5RwaQIA1heOPwwKt
         PgPxdbNmNlFSyFHvMcSF1o2AkXlFVk0YBJuVP/NGqJwce6E3EleGXRgTa3fYDI/stXIn
         28raa0ZhmPTnH8VTljkRhB7UEKe6Y61zgCoJQafdV56XGf+O6WBZixBbnH0uYNjIYiAF
         hJ80rffLRn+/Ir4yJ8E1q+hJOEYUOmyB1cHnrUOW5O270QqEOlVg2+yQZfIXL7NtO63d
         J8nUhG7EOioS8NbA1ElWfgloqYzVvrNnq8rsRPlg+8jCHLD4jUYhUUt8YbuqQOJYaqTK
         M8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203630; x=1779808430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=j+dLOamysi240JAGuA0zhYm0X8/wn2hkR+T0zk5D2r0G4964mfXwyxYypOkMrOcQB2
         WWkYc7EiAck03Omf2ujDhsIQ6AgnQK6Txs3PE61GLV/y5lhXucNgFzIpedMd0KsGk3Oq
         WO9uTBYn70F/LuVxWznQtPgydCU0GyArcUDVn1X8jQQ6Lve74z34td408UUftPR/YZR+
         Hw3t1OWmU6lfTxPvy4cZti1oIJKmerlImrYHbWOds8dnMpXLyGdqZBmWCgAWK81y4ZGA
         uwEbG2s87Bne7ZYyFMJukq0uxDvKC0Y7RY/AWPJJcezjiY5ByDf32V08YrmrtkkK1TMB
         TK6A==
X-Forwarded-Encrypted: i=1; AFNElJ+Qg4XiIw0ac0j4wfrFo3S3aHuQdnXwR56b/gJVfckVQredpYKP/g6uPxZFOGFzhIx4NzWrB5E3+8ixpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw545RIFpvwW9fTA1UiyMuBs4LuwPuUV1f/Jf6Wbs9aQTV/z3Zp
	yJLQP9j5i0taZM4m/2bfCQmWfF0MwRRykJkn3tX1XDihDBOxAjbtsz+p
X-Gm-Gg: Acq92OFBg0ADFRiGOBHZcXjV/hkHJrRBZ3dwEoaZCCvNHOt67v31mRLFrd4odzaP8CM
	uQQ16R5n8WZZ77gZToKOzZc2Bh6ows7Cbh9lpjPfCmC3lvtUK7OL4Oi1QBWGF/rnF/8r2Y6IYaB
	Uvpy9b18SnFxBJuFL6zPyGdu0SBY1vRvNef1ZKCmtHCT2SfVZJWl34CI35nFna2RGX6+eKnmXGZ
	Xe+b0QjMe96czKkUYkXB1EyltnXPTjb5Dy93iu2rkVvP9RlhDJOen+ACPmr34EtYhvgIvVwSHqM
	TX7gn+V31QPO8wuNwVkp4W4m1JmZt6sl8Zv7cPT0fjnljm8QEaO429aiY/h/RjAtWVrurrx3wZG
	AsbWGPYczGFjvaPPDo81p1fP+SeHJUPhK2trot+j6HYufsxkfR1OthY0bCHACdZODroXSDF3NbL
	RGIThIG5P1GBhrA8SsR70SXbf1iX7AvP50XXRY
X-Received: by 2002:a05:6402:e04:b0:670:ef2a:217e with SMTP id 4fb4d7f45d1cf-683baa391aemr10613028a12.0.1779203630340;
        Tue, 19 May 2026 08:13:50 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:49 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:53 +0300
Subject: [PATCH v8 8/9] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-msm8939-venus-rfc-v8-8-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
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

