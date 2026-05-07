Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05FF239E7F
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 01:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778118423; cv=none; b=IlI8p+QMuw8S9y/hXMJPrN2qQ1T2ZLpF4QfapeYFrmITqvuJNVe92gD6MaOUlgsO9B/6BCDw7bPwL3HjTqDmE44vo3h7hjeXGAZRn6o1zH3oTbrCnN/OzmBMEx2/cTpYMwaKNFB1dR5J30f+ukwdCqBHeWXwEnErhFiDJB0HzBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778118423; c=relaxed/simple;
	bh=ptahMHxAwcMzgJUkdJAwL9Np/nYEs8gByqgKb70ZGU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ot4fCcf6QW9X43Yd9Bfeu7zI6kTz/AVG2K1FlQY5SUb+NnSEnjXGngfRg72W4/I9Bl8uKfbeStjwfDFKSu/b2NAgVnvEGBJHU7aQGnCb4m56inAharhuycJbD2C6i9fTBEikjUSPCcU+ErqMbOrH+zZ4Vey+/UBUR+Ek5SJccUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=e/t0Bw0e; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="e/t0Bw0e"
Message-ID: <35b45fd0-fffb-455b-b19d-5c29cc955563@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778118408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2lk0xUHftJD0rJZhHZIYmoYd2dWXW26635MabL0+A0s=;
	b=e/t0Bw0eH/FG81UNZB8PXX5CTv8G5YfwI473WJ6VQD5RryLVhi1MV/jgZAWcoWxlvxF8G7
	jTnsQzrJqpZwoMpyUabou0hxvPpdvwwXinacY0Eqgv/KGVsvG459eUmpjGgrcpsJpbbxqb
	UynFV0PS4+j+bHPupsbc2OQX8Whlaixhr9Ba8FfhA+8lS1rOJ45tqjJnHhvDEKH87dtc8w
	ID3vI7O5T29NVDel+rmtmVeIYbtjMmJmDVVwM0uczjeeYiNH7yVguVW7hNSm8PPUjqlt1p
	nqZbtFz/AVb6go4LZDV2aUwyV9TUqI3jCDw+/VaPqOq7di2UcNzbMG8lMomlVw==
Date: Wed, 6 May 2026 22:46:33 -0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/6] ASoC: qcom: qdsp6: q6afe: fix clk vote response
 type mismatch
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bhushan Shah <bhushan.shah@machinesoul.in>,
 Luca Weiss <luca.weiss@fairphone.com>, Antoine Bernard <zalnir@proton.me>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-2-val@packett.cool> <afvWsfgIz9Q-_cjH@sirena.co.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <afvWsfgIz9Q-_cjH@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/6/26 9:02 PM, Mark Brown wrote:
> On Wed, May 06, 2026 at 05:33:02PM -0300, Val Packett wrote:
>> The response sent by the firmware when requesting a clock vote (opcode
>> AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST) does not actually have
>> the same opcode + status payload as APR_BASIC_RSP_RESULT. Rather, it
>> returns one single u32 which is the client_handle that must be used in
>> future unvote requests for the same clock.
> Please send cover letters for your serieses, it helps tooling.  Please
> also supply inter version changelogs.

ummm:

https://lore.kernel.org/all/20260506204142.659778-1-val@packett.cool/

I even Cc'd all(?) the lists, as usual.. Oh, sorry- not stable@ I guess.

I didn't even realize the Cc from the sign-off section would actually 
immediately be used by git send-email, I thought it would only get sent 
to stable when merged.

~val

