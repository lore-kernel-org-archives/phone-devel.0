Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B523FA5D0
	for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802312; cv=none; b=KvQZA8eG68vvbDIoACQkZJ9Az8Q1mROsCv2KSesdlcbVZi2J7tbioX7HHXtcT7B/uQ0RfeINVAGHmxlOktxMHpj1xBrYmqKUq0SoXvgKsbLeMO9H9k+hzboUyKoU9fWzLjDV6XXHFuNH8TbOf6QjDmzMfa4U90MI1Ouz5KLjeXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802312; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JT+C6BOfWoQvW+xJjZsbbvXjUw7VXONEjVoEsh0w/ABs5/BGV1hUhHTmXt39zfre5Ns7OeG+lkVTFyN4fkVayglQGcKuZcDqbifPS6sHh7XjXzYuJF0lSHmn5GBQth04uZgOaXcj1ihneRG9TF09+J1A3B+r9vsD7h5UHOYzekE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTsUz0n7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTsUz0n7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso29926385e9.2
        for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802306; x=1780407106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=eTsUz0n7yYcM2Nx55/K+Lme1gYXcoWxuIdcD4LTBanSDP7tAbZGEaQyQnkP+21/ll4
         fnjSIy9wisKrcVcX965J3qlylj5P8r/GpnqMELwKtmnYFO5pWVGt8C8yV23oBE52yJ+i
         bBIW0d6F7TEJcpiNtB0lQKVmsn4dKNCMNEPMhZ/RIPKN1ur3IMMuFBTz49pt619DIHEF
         FSrfcmpXLOaTNdZayxi33u1efq4/098YBdlk7uNy2EnF7cW4zWad7WHPdjvLoQXOycdJ
         E+wiwJmOTpHqsKgHGvu6MYLhxqefHmMiVNCTOjIEpmixKp7HJFP03inNgkdCZykjRy5r
         dTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802306; x=1780407106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=N5EIUTnSM9jCPvr4Ukqfnh/n+BSfXidr56l1ufmP5Sxz0H2XuRALn9PS2f9vEsZkD8
         GqOw7UnNVcxutDZ8V6v70/glaYf0Ia0ZdWjf5jO11S5PpL3NMLIDtM7f65t0nS+ckLzX
         mNxsGyJon8JkY3Np1yZfum3Q2V3TizQFdSJR8PyGtmuGy/VqrDs9sErAcI75Pvw/93ri
         6FzVKi83yht3VLrf7hLNTsLCovKP+k/utOedXeTVVKw5MvuCo5jRncslXWfhagq+uuDX
         YGGJfc8ZFzdDIxp5Qbv3rS6LLz0ialsozGXj3fuxcYaNCV8daTaqNfYhIJ6if6IJ302S
         iecg==
X-Forwarded-Encrypted: i=1; AFNElJ+k6H/JA51iG9sjjYqnyvAyAEvt4I0gTPMZBWADIw6yy89IaiEUhGZl4xd7f2l1Un1uH4WnXCJauEOzuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIaxUlD0mMIpkDhLdQDK+Ts8pknQOKU0+kjBKO93f+/C2UstdY
	WjtsrYm/Xigjql3kCnA0k+i33P7t3S6/1VuLE+SAVnGucNoei81vDE1M
X-Gm-Gg: Acq92OEpyRjViU3gn1OgF+ZpnnAy/C0CjXd2M7o7JmVLBfK5BAnfEgZ+oU2FdFXloEe
	M/I6K3ZbSCHB2bj7fZd3VBbBIcHFNMth+alxFhvc4g9CTdarAlVQJ20l4wbERMiZ+opfjbuYj0R
	8t3cHifodOFSds9NWWff9xYnMRraFsL8vdETPf2UeOxHyxUyQoKrvyKvJLEBpHdFNs7lOSvEzN+
	N6GUJnzShk8QBB74p65Vb4HftJYmtCRfwmYT9DKfFDvoo5hVrx3LB37de4VDbvYhIARakahypuL
	30GXZ3dR8OqNOOb/qMvA94fw3ruTH0eA2DRj68wtVayGsF5nXw/wh4+1rjloQs8bWXOmQFqgGwT
	cDRRnRRMfkRIKSrmSFK1H4dmrK7mX0ydf6BeKfyev5TC8lMZF1Pr47Yfp9mZ4aB5qcDZWrwGDwl
	1diAEMJaAQrnkTUnGAEJWNh/JjnQ==
X-Received: by 2002:a05:600c:3b12:b0:490:545c:7a8a with SMTP id 5b1f17b1804b1-490545c7c2emr215250765e9.20.1779802305717;
        Tue, 26 May 2026 06:31:45 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:45 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:30 +0300
Subject: [PATCH v9 7/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-msm8939-venus-rfc-v9-7-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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

