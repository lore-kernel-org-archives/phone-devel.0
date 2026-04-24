Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB1F3FADE5
	for <phone-devel@vger.kernel.org>; Fri, 24 Apr 2026 19:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777060696; cv=none; b=WSAtL0SgNMiwDTTclHS8H4sUEZ5maQ8/RFrU8WaVfNAjS9IOjVp+LlGCxouRy9rNkCJ5TekOW6DO3MfF1bFdXtju6V+5kD6xcGs/I4Za/5EWdkxknJMyuG4SFooia+loErQXYK2P2r8yC+NhRQG32Wn1y0VVWlWwg8w08BP74tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777060696; c=relaxed/simple;
	bh=uCQEJZgXHrlBR8fif2fi669uXR1ZpKllKRXGAVjMdRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bHuM8ll+tDhhkQuA+tHGndZZEPMjZMkeOgbZhtO55/zpHdH52ejqsA5D3nfzV++snG9VXQIDi0eXD/QjUEOjzwTMq9/79vFdDFW7EM5gSfGN1vGEAykPAb3IbscWiSwqAzm2QPPUSYYBxmHsyV7ETwFF2aYxdJW3CJEOiCqM4MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=dl3bYulU; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="dl3bYulU"
Message-ID: <0f465991-0ad7-47f4-8cc3-237e131f3fdb@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1777060681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CVawkKQLvLPTpGW9LkdsKtXLR4eUHtA0MpmU0WdVWA=;
	b=dl3bYulUePrkGQnXqqlfgE/VAva/4gHw5zFZLEiN1ZOuY2J51f81T5IroC9R9CutjnruJv
	ahLWaa1+ePvqs3jR8ikPf7s6NZwk8ESpgM5cvKulrX7UU9QrNtDo2masxFi2Jtgi53qb4+
	JCArTuKgbqOEq0uWVWzgT+jNVU1Z+PGbTs5XrWagHTBMMOvAeWnjIELqboqJC3oVmfRbv8
	pnzo4PNkOn52zEvIm9lItZIknGYjC/jjMrMRYAtgVMMK78nidinFx+u2+UPn9NDSsko2qR
	M3RIyMijzbN6YvfGzN7dC/G0+87gfRBIso2b2oCeZQT6yGtAWSwUXl37MbePAg==
Date: Fri, 24 Apr 2026 16:57:49 -0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] ASoC: qcom: qdsp6: q6afe: fix clk vote response type
 mismatch
To: Luca Weiss <luca.weiss@fairphone.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>,
 Antoine Bernard <zalnir@proton.me>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260423050801.210840-2-val@packett.cool>
 <20260423050801.210840-3-val@packett.cool>
 <DI0B81W07N33.3HZQ4R8DEJ9EJ@fairphone.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <DI0B81W07N33.3HZQ4R8DEJ9EJ@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 4/23/26 3:11 AM, Luca Weiss wrote:
> Hi Val,
>
> On Thu Apr 23, 2026 at 6:41 AM CEST, Val Packett wrote:
>> The response sent by the firmware when requesting a clock vote (opcode
>> AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST) does not actually have
>> the same opcode + status payload as APR_BASIC_RSP_RESULT. Rather, it
>> returns one single u32 which is the client_handle that must be used in
>> future unvote requests for the same clock.
>>
>> As a result of this type confusion, the status returned by the callback
>> to q6afe_vote_lpass_core_hw was actually an out-of-bounds read. It was
>> only interpreted as success (0) most of the time due to luck, but there
>> are reports of random ("more likely on cold boot", "depending on hacks
>> made in other drivers") errors such as:
>>
>> [   20.961100] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
>> [   20.961131] Failed to prepare clk 'core': -110
>>
>> Fix by correctly interpreting the response as a single u32, and actually
>> store it as the client_handle to ensure unvote would work correctly.
>>
>> Link: https://lore.kernel.org/all/5976946.DvuYhMxLoT@antlia/
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>
>> Found by reading and comparing with downstream:
>> https://github.com/YumeMichi/kernel_xiaomi_pipa/blob/27190355fb31284988ddf505cb7cfba5128104cf/techpack/audio/dsp/q6afe.c#L1261-L1263
>>
>> What's really bizzare though is that some of the logs go:
>>
>> [ 10.827469] qcom-q6afe aprsvc:service:4:4: cmd = 0x100f4 returned error
>> = 0x16
>> [ 10.827512] qcom-q6afe aprsvc:service:4:4: Unknown cmd 0x100f4
>> [ 14.052896] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
>>
>> ..where the "returned error =" message is something that can only be
>> printed by the callback if it goes into the **other** switch() branch,
>> i.e. when hdr->opcode == APR_BASIC_RSP_RESULT. How reading out-of-bounds
>> only in the AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST branch would
>> cause that to happen (even on a subsequent vote after the first one to
>> perform the read) is beyond me.
>>
>> Still, the person that reported this heisenbug told me that this has
>> actually completely fixed it.
(upd: not really it seems, as expected.. there's gotta be something 
else, could it be trying to use the vote command too early before the 
firmware is ready for it or something?)
> This seems conceptually similar to what I needed to do for SM6350/SM7225
> microphone (wip) - it's not necessary for just speaker btw:
> https://github.com/z3ntu/linux/commit/107bf0c39e40a207036e963f878f39467f978393
>
> There I'm storing this handle per 'block' and not just one "vote_res",
> essentially copying how downstream Linux does it. Your solution
> definitely has less lines of diff, but I can't judge whether it's enough
> to store it like that :)
>
> Thanks for looking into this though!

Oh wow, didn't know you looked into this already! I'm surprised it was 
already necessary for getting something to work. We actually shouldn't 
be getting to the unvote part at runtime yet?? o.0 As only the recent 
"ASoC: codecs: lpass-*-macro: Switch to PM clock framework for runtime 
PM" series change that (and tx/rx weren't posted yet).

The downstream multiple storage thing seems completely unnecessary as 
the entire request-response cycle (afe_apr_send_pkt) happens under the 
&afe->lock mutex. If another block starts a vote request while another 
is in progress, it will wait for the first one to unlock the mutex, 
which would only happen after the response is processed.

~val

