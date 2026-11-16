Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.39.219.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834937;
	b=kRm1MSSyITWqxPxW2bnq3SI3qsU6nJnCdGMNbkejgsUEalbHfqQ1smmZNObtt9Odnjk2
	 Paw3A9f6dMkREjyMhFDQZGo61/TVtoZ7BrpaHJxb6nx5RM5Q+8CnAXI94jl6BLLtqARJF
	 EosqArrhiAkx1nU5NQbzU32ohLCAuvfmOgBXYZqTtZUKJIASn/HkQhBYdRfOQugkSqSvH
	 BZdPsokYbbtHp4YLWPqUcqNr3KrdDCH7hCrRiiVTg+lCAavN5q7odKi5uL8qYjBAeNv8B
	 MQ3NVTmpYti46Jpbtwm2WmY5Buws/cu3GLlJi2easTgCB21q20ua5WBiUarpX4Mas2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834937;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=qv0E9umeW5iq8XQGTrmgEL6yTVV22eJdaaUMd3VC/yE=;
	b=eOhPl+ryIv+AYhDnKw3yosZwq43XVHYXjvpLfsxI5ANceIVSLjEN1+8MQiq/U/DW/6xt
	 JkVeM2PgBMiS7tePRuzp+sD7fhl0f4Y5CGJp6fHWJ7AIJhgeefWHc4V2gYbQ+95qeISlP
	 JutRQgtw0J6tvMDZxDx4LzX+c/wYvzhfS9tfdbuMnxDWpNZga43707+kLpU0xGGEKYZvp
	 s6VZ6Pg+muawnfrxzgfytfALnk0787ELu066Z+LDuUf8RZuvkthbzz/AsAPEuumv7PtyG
	 rE9utu+Go/XASoS9gytlMrwC5pqN7ljOTLnPmta2tqKNP4owjCNMBunGkv7YdHiJeHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kaechele.ca;
	spf=pass smtp.mailfrom=kaechele.ca;
	dkim=pass header.d=kaechele.ca header.i=@kaechele.ca header.a=rsa-sha256 header.s=201907 header.b=AWSy6z8W;
	arc=none smtp.remote-ip=54.39.219.105
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A27606A32C;
	Mon, 16 Nov 2026 13:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A27606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=kaechele.ca header.i=@kaechele.ca header.a=rsa-sha256 header.s=201907 header.b=AWSy6z8W
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFB0035D6F5;
	Mon, 16 Nov 2026 08:15:25 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1794834928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qv0E9umeW5iq8XQGTrmgEL6yTVV22eJdaaUMd3VC/yE=;
	b=AWSy6z8W3uvYmeAuapaWKYflN50ECGqbmimuMrILuDvQmoWKqOAOB80/0kVY/H9Ib1Dwkr
	L+hUgnzzYoTPT5Rl8JC1mUIpY2dq2Iqkw2MSOaC4R/PrmrSExTxWK9pSaE1NDwpbjjt3e/
	qkpNZQ+m/TNBbLHzCFRCzwclxRSq9Ho=
Message-ID: <a1f4322b-0564-44cb-a548-ff87d2b19595@kaechele.ca>
Date: Mon, 16 Nov 2026 08:15:23 -0500
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/6] wifi: ath10k: usb: fix group key
 installation
To: Tomas Paukrt <tomaspaukrt@email.cz>, David Heidelberg <david@ixit.cz>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 phone-devel <phone-devel@vger.kernel.org>, jjohnson@kernel.org
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
 <20261114090737.64348-2-tomaspaukrt@email.cz>
 <7e36cb20-7752-4778-b068-56d41819f670@kaechele.ca>
 <dfae62c8-6fd0-40da-bc4c-65d4d6594cd0@ixit.cz>
 <5Nd.ZqDG.68CtbqKyNmY.1g{Phm@seznam.cz>
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <5Nd.ZqDG.68CtbqKyNmY.1g{Phm@seznam.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

I can confirm that the fix from this patch (without the bus check) also 
fixes the group rekeying issue on QCA9379-3 (SDIO, firmware 
WLAN.NPL.1.6-00163-QCANPLSWPZ-1) without David's patch applied.

Regards,
Felix

On 2026-11-15 06:43, Tomas Paukrt wrote:
>> Hello.
>>
>> I'm pretty sure it's not related to the USB bus, but related to the device firmware.
>>
>> Check what firmware you use, add the `.no_pairwise_key_del_ind = true` and
>> report if that solves your issue, I'm happy to send v2 with your usecase covered.
>>
>> David
>>
>> P.S. Felix, thanks for Ccing me here :)
> 
> Hi David and Felix,
> 
> I tested David's patch with .no_pairwise_key_del_ind = true on QCA9377-7
> against my patch, 30 minutes of disconnect/reconnect cycles each.
> 
> You are right that the firmware sends no HTT security indication for
> the pairwise key removal, and David's patch fixes that part here too.
> 
> But QCA9377-7 has a second problem: the indication for the group key
> installation comes late, from 47 ms up to 4 s. With David's patch 64
> of 184 group key installations (35%) still timed out and mac80211
> deauthenticated.
> 
> WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID arrives within 1 ms for every
> installation and removal. Completing install_key_done on it gave no
> timeout in 211 connections.
> 
> So David's patch alone does not fix QCA9377-7. I agree the issue is
> not USB specific. Without the bus check, the wait would be completed
> on the WMI event for all WMI-TLV targets. Could you check if my patch
> without the bus check also works on WCN3990 and QCA9379 SDIO?
> 
> Thanks
> 
> Tomas

