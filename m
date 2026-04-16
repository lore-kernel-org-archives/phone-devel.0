Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6603CD8A3
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347079; cv=none; b=LVj4nMUymbkjDpwsm/jAhf19Yw5awKgUZ9bymwba0Ildbsur1SquBzmP4578627zq3JpIpxFu8yqMQmSM6WvxlOURw5/Aa/EeCk8Kzxi2GJeqva2vrhGrndlTsbfuTZgA0CHSHpnHaIZ8+bFf+90KXimF9hAyM3/tGH5Tf21xvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347079; c=relaxed/simple;
	bh=+qxk9YKyNyEiRkeW5Mgtu8HCNYz2EeeeSG35f/DmqEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0YoFN9Vz/nqxdiL1TYu/EEkYeg4njvpMM4EJGmRRdWQQt3va/3u3/bDwR9O364J4WENYebGhPIxhiJyotXksHej+T3lJyyYcyPBspUYTjpJdb8koDigwMGzWO9XXSdbaVU1dZUuvKUj0jEl8S+u1utqW/pbzPk/Vj1HG1AqhfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDn48dsJ; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDn48dsJ"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7982c3b7dfcso79733147b3.0
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347069; x=1776951869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpnkPSyCrrxqGvSDrOl9HhMQ28DTCCYBlLhEHVmZVf0=;
        b=fDn48dsJPQKBWfJCXLRzNLCQdvybuIC2gXn2uRFqAs5hAX4KrIUdsXcYV72VqJFgLY
         /nEjWzyCLmljGyR0SGhIWd6thkrMfJZQxzo+TZKHuEf7eN7QLlTTiv/L2bDHo6HgEcEt
         v1mkmw5ELq0W7hTbyA8QbFNPW5y7MAg9SdRPRP0mxqfAn8oW1Ec266rVOuTc4zN8ONOa
         LoFF9CAGUe8QPNBgP/qVpPpp2giALlc5XezBBsLWYHMprTFyuqM7BeNLgTRvGPNPbXBb
         /lwmdmKd/UFJtMjR3uWavjJyPFuYDsl4Gk/Z7Wea8QgEtHIFw8t4zp71YNKYrWfzedft
         C1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347069; x=1776951869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TpnkPSyCrrxqGvSDrOl9HhMQ28DTCCYBlLhEHVmZVf0=;
        b=OpYsI2Mplc8RN5gGKMSfbFHVlvGyaJJ/lN3cY98QXzLLvb6OWk0/1tq0/SAHfuDnWq
         pwpogoawT7ADCyIPVCJe2W7rjKQ3TKS8SATUs7d1f7xwjBgMn8Ao0xXNNXT0FRTpfPMK
         cqADbDSkW4/NthCn5jmI8PgJjMNLfme22Yc8rfrDI9mnuxu3la9UZIbCIyqcnZV1UiEF
         ydj8npOEKv5rJtTO57VxwQEhUjuYF5EF1EZ+pzAilc7aBbCzO6in2YAELKn4s8yW2Bs6
         bBRk4Bl2pcueIWS6MabEDpOXdLFmyMok70w6D1Q4h3PgV8x8gUHvTmj2YVZXQxsG9BVy
         cG/w==
X-Forwarded-Encrypted: i=1; AFNElJ8GKVJF3sXQLLXcYclg1RJBDKlEUcXPe8V4QuLrlOqPMXa3sRnd3xqIvSUu8msSIhA/YhMCmHYJ9OWSWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzhJoi6fg2KTNYz3IGKlwWMyE41z9N18N9HMnuLhiTTEApopOy
	/bSq5rQflBFmwr6P7SK0ZuRfN3ocBi8g9OUAB2OlA+gAPRaW7Evp9fTb
X-Gm-Gg: AeBDiesgjZCk8xtniXV9hvS7I+Aq6fCAFxMLqaAfzq4AzFCeWR/1YG1GflIjyW1MpEF
	V2VevOvITODvP9x9RfZxmLUfwCnnuKr9CNbyZ1wAi0y3ReXlP37VmO88lVOZ84uzn75D5uQ7uUG
	HAv7nuhv+gT+hNu2De4L91bVMcE2+7w6nmK6PqeSK2U4fQGvU39IC7kpbKxMsDMnNJK0ZEinUKh
	IBmDdR0nxOur1gjt/ZowNDi17ZiOwWceTNwB98Uv6bQuM3WWh6TpWp+IlKXDacrAxOOg/UPVnn9
	f8zQrfvTts/yzzx/s5YSAguxqdf9zU/BJVOz3bu4iE8VCt5BIA/jNsSAGK6dVJIZ0HVq2NrD9KU
	7X5hGt0Ug7jeNWJmErTl4FLOQL6wOMzjZwcgzGmpGKLgtIajf5ImxKNuZSpic8jrpK8go4nsr+5
	ksEyVzdbSNDcbP/fCQBWLbPjmCLg==
X-Received: by 2002:a05:690c:6b01:b0:7b2:7dc9:35eb with SMTP id 00721157ae682-7b27dd88a12mr158996207b3.50.1776347069632;
        Thu, 16 Apr 2026 06:44:29 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:28 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:52 +0300
Subject: [PATCH RFC 05/10] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
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
2.53.0

