Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.68.154.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783947;
	b=y+/TdYwLMBpqupArcerr8Y8Y0XIHKo26D1+iKkfSS2xYb0qPJf7GH8h3W8UuuRKuTl/V
	 hVu/BSUr5x1iys9XCZIlz+MLBzlaTXycfxOtSsk8lr0zEbb1gzHC7O6KQRh13olggfd3A
	 JiE0nIIaoADQWfgPwMDxVBxWAn1G5UlriFswKYKtGZnKoyxRuH07dDYeBXBsPhFl5p7o7
	 oMg8fmxeW4/RsUwubBXkajdJxo5PIzG25lmugmbaQXEmfpWIHToJPS9oTQ3MjHfDdECV4
	 7k7+u5xGiaicn59ctTbg0OvmZA1ftmB/8qUkmdY9FDMVjZt1LWo7AzlAgcpS3fJt1ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783947;
	h=DMARC-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=XBVMhubxDrjgosRtIYyRUup87SqKUzHHbgoUgAZzknY=;
	b=GZLdm34VCZMCH2hm/AjHIdovx+mo8vP9KrGO0z5Dns/TAi/5+hS2O2Zc86zRkRnJqQBP
	 i7p26lPvZ/za9Xq2bwgPNOxiqfK6ksFxeUKbB7a7i54D3IiWFzKorIA6K5ibJpClKavYX
	 Z+9joukAMUHBbzaoZSTzX4/mtXktosCH6i/0q41fRbSp4Y3uv3pAxsQRlgN7L+X2Xv2w5
	 rpQs+HebdInp/pggVSw90rJ14ang6BnmEyuRwAeqDzJq6sOY/KrbcCDAq2UrTre8LWaIL
	 8fhba/ddKg3+oBUOkefkWAQthB7BA0SkqkBq8jNp7BVe4EBeC06MRJoZPGMnl//JSyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fromdisposition.org;
	spf=pass smtp.mailfrom=fromdisposition.org;
	dkim=pass header.d=fromdisposition.org header.i=@fromdisposition.org header.a=rsa-sha256 header.s=mail header.b=r5AuHYg+;
	arc=none smtp.remote-ip=51.68.154.128
Received: from 4do.net (4do.net [51.68.154.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB44606A31C;
	Fri, 27 Nov 2026 12:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBB44606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fromdisposition.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromdisposition.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fromdisposition.org header.i=@fromdisposition.org header.a=rsa-sha256 header.s=mail header.b=r5AuHYg+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fromdisposition.org;
	s=mail; t=1795783944;
	bh=edUFFxktQm+Xw+Y/mOQbI+L/hma7NQuxzUFWhwq8Nhc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r5AuHYg+ii2n3YE1xLPkqKTA3yWAicbeT9zAdmh05SoD/WznV8eMPEuPyrMAim8CX
	 w9NDxEOqxjPKV/Hg7ORHBLIYOIrY8JsAodv7rNo0WTXubhgXPMdralM7guoW4kaZzN
	 tflNiOFu83QyGOmdP6c7kMahebmgwwSyodhwQNrfoTs5r2nuLyhV49nezCkiIDI4a8
	 da5VQ6RIBhCkmRyJYwXWC2wE0FSwHP4Hxs7UWqG9D8AfePI0TaSN6ISyaH815c3fzz
	 jM0L8dQYiCkvp3EXYHORO/om+Bx00pcYONjyjUCr6Cjof5tfbR0fb6FQBMbhfWa+zs
	 m+u9TRnPeAulg==
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 12:52:24 +0000
From: Demeter Barna <me@fromdisposition.org>
To: Val Packett <val@packett.cool>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Srinivas
 Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Bhushan Shah <bhushan.shah@machinesoul.in>, Luca Weiss
 <luca.weiss@fairphone.com>, Antoine Bernard <zalnir@proton.me>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] ASoC: qcom: sm8250: shut down MI2S/TDM AFE port
 clocks
In-Reply-To: <f090337e-e817-41d3-8fc6-0c64cd71fba4@packett.cool>
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-6-val@packett.cool>
 <dd0e22ed-e464-4d61-b354-b396f9694976@oss.qualcomm.com>
 <f090337e-e817-41d3-8fc6-0c64cd71fba4@packett.cool>
Message-ID: <6929a7cdb1b48a5edb057669ed5ea5aa@fromdisposition.org>
X-Sender: me@fromdisposition.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-07 20:44, Val Packett wrote:
> On 5/7/26 5:57 AM, Srinivas Kandagatla wrote:
>> In your setup are you sharing BE dais to multiple FE?
>> 
>> if not you would really not need the count, startup and shutdown are
>> paired for single PCM stream.

SM8350 has the same problem (speakers on PRIMARY_MI2S_RX). Without
turning the clock off, the ADSP never sleeps again after the first
sound: 0.0 s of 30 s idle. With a .shutdown that sets the same IBIT
clock to 0, it sleeps 29.7 s of 30 s.

I tested it without the counters, and that works here.

If there is a v3, I am happy to test it on SM8350.
