Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BF7375F6C;
	Thu, 23 Apr 2026 05:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776920963; cv=none; b=mGyDyKgXMJv4ZVhFKZDBRFxX4CvxHWotjxpyKk+2dyx+Q+RZmYIEVZlZBFTBmu1G5zKkoR6XxOdhufFwu8QNSANnvc6SUc2jdaLyfAQaUemCmAECWCvhTtFjgmIUWN7K4gepIL38mI6yNFi+qQucCdVLVkXDFQYX2Kea74hHZKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776920963; c=relaxed/simple;
	bh=2CcxHXcl40KXWqdQm3i0SJmM3IAwdd3p6yoEKXcE1zE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYUwFFzUkHtSdg7isbhYw9Yiy7i7n8VS2Lzf3sWzOgyKXwKl0J087KqvB4pAR/dN1qj81sz5R04xVljQ2ueC9lldkmb/EGfBfguAl/z5A14F/yna1W1QYA2yR40Psjwye875dxbX91kz6xCp7FlfYoJ4upTNdytxVBipLKWVCaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=rUyxOvPn; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="rUyxOvPn"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1776920950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0B16G3jwiYGXujlGvcDyOiqCiwiXORKPt9MxgmAF0wc=;
	b=rUyxOvPnZGwd0miXv0DPVitxlUPvMyulO9JopDGo9TatUkZG3VBlJV45VfDWiFzcOg9mI7
	y+IZ5hINQLKMEowedig4PedHQE9OLX1aXQJ1OexIODGTZb5iy77QbOB2jWAragyOYj8Ome
	jYYY/0y7JLRrb4XXjksD7AbZUpgySnCt127iXiqY6b0L+R9E52agjpn7z98AVxxq56cis8
	wMwafM+q1vDX7TqV2/gKTtAFqtDcTocdx8gEXHoI/TjTABikpTAoGS81DK5vDaceS3ToKZ
	6iGw7y3iMsOb/RhRNtdxQJpd4ljyJsrSEqJnndBMQPe2+uuUJuKw7xrXZ8SQBg==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] ASoC: qcom: fixes and improvements
Date: Thu, 23 Apr 2026 01:41:00 -0300
Message-ID: <20260423050801.210840-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

These patches are mostly the result of testing/debugging the aw88261
series[1] with other users in the postmarketOS audio chatroom.

Specifically the first one, related to the issue from [2] I was nerdsniped
into debugging due to totally unrelated changes to aw88261 seemingly "causing"
this (much earlier in the boot process) APR error to appear or disappear.

Senary MI2S is necessary for the motorola-dubai smartphone[3] where it has
been fully tested by me for a long time now.

TDM is necessary for e.g. the xiaomi-pipa tablet, this will need retesting
though as so far it's only been used there with hacks that use S24_LE format
(while calling it S32_LE) such as [4] due to the aw88261 driver not being
correct (which will be fixed by [1]).

Then there's a couple general consistency/correctness changes for sm8250.

Thanks,
~val

[1]: https://lore.kernel.org/all/20260420213250.215465-2-val@packett.cool/
[2]: https://lore.kernel.org/all/5976946.DvuYhMxLoT@antlia/
[3]: https://lore.kernel.org/all/20260403054417.167917-2-val@packett.cool/
[4]: https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/8be067d8d5507a4ff7274fa2a61e59600aa7a308/device/testing/linux-xiaomi-pipa/0008-ASoC-qcom-sm8250-Add-tdm-support.patch

Val Packett (6):
  ASoC: qcom: qdsp6: q6afe: fix clk vote response type mismatch
  ASoC: qcom: qdsp6: q6routing: add Senary MI2S ports
  ASoC: qcom: sm8250: add Senary MI2S RX support
  ASoC: qcom: sm8250: add TDM RX support
  ASoC: qcom: sm8250: shut down MI2S/TDM AFE port clocks
  ASoC: qcom: sm8250: apply codec_fmt to all codec DAIs

 sound/soc/qcom/qdsp6/q6afe.c     |  10 +-
 sound/soc/qcom/qdsp6/q6routing.c |  11 ++
 sound/soc/qcom/sm8250.c          | 258 ++++++++++++++++++++++++++++---
 3 files changed, 259 insertions(+), 20 deletions(-)

-- 
2.53.0

