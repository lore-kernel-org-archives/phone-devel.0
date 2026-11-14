Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.42.129.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696096;
	b=ieH/xz68Q815WQ5f3bgFnabAR6+DIfO4RTqrPfQOmepExqBIg+HXcv8Cqkm2SX6P0qT8
	 lf/KF+3RfZ5wGQ+/QE6WKZD6V98Rx7RB331BWVulhIyVx3TdvW20dSeewtf7ThwSYLSo1
	 wbVpOpnwsOyEFIfelcFtKnPzY5PWnRVE9zAq6rIOpWiVSt/htkRDZDF5tS4eBZgT0nr/S
	 UmVfuN7tbXTRi7pGp9nr+nmMXOLVsJ038ZVhbkrRNcYVJlibbkcRucRT0iWIoX75Fh1K+
	 1PGPnmuUKmcpkA/SgnMH/FeeFQINL3pW6eoyiQuR8JnwGRsFwUPtgonk3Z1T3933UYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696096;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=KD8FdQRtVcn2BodazGF3whakHyq6T/A4Sy1Yxho9aDQ=;
	b=QwxvkSwv2lsySmcQam5BJYXYBKTDmn/s4zb/mAmfw+qlmq/UL2sn6lxdBYAxZspOuRzS
	 ZAeNA+fMA9zJAnTlt3iTAF43ayilFK1Su662p1nqvWPw1fj+le75Qz5f1R2oTiBd+HNV8
	 62mVES+FkqoT19Gg4Kuvk0eXD2B8vDBxMfBG+dy3cQ8p9eny7f1kzU58WZp1x9/hICTGT
	 HcVe6KJjnGtfr5TsUgI7PAUJNcLgko45DcSwsa+ZPS1elBreYpvGtAGwoKdox2xvLuSnX
	 Qbia50lKa3nkOTfV/fy6YhGgjSsO9RnF05jhN3CgJSnYn4hsk3tcq2dN8QrBdWwVYfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ixit.cz;
	spf=pass smtp.mailfrom=ixit.cz;
	dkim=pass header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=buygUrrb;
	arc=none smtp.remote-ip=84.42.129.46
Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE7606A323;
	Sat, 14 Nov 2026 22:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5DE7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=buygUrrb
Received: from [IPV6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e] (unknown [IPv6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 0AFAE53401D6;
	Sat, 14 Nov 2026 23:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1794696093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KD8FdQRtVcn2BodazGF3whakHyq6T/A4Sy1Yxho9aDQ=;
	b=buygUrrbgvo2DpGm9vnB0pq01yTJsI8UbSPnNT70ZaDSim7tgYPi2LkuBWGR3NlUXEWhgn
	L7/x9WpUYeWIJnXczvk9XVtbDj22lgA0MDN51pYJSDqRs5PUBqAdlwHGI5Zj73t0I2ksxK
	cANBEvMYphiLKxaxo4DHzOz49x5lL7A=
Message-ID: <dfae62c8-6fd0-40da-bc4c-65d4d6594cd0@ixit.cz>
Date: Sat, 14 Nov 2026 23:41:32 +0100
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
To: Felix Kaechele <felix@kaechele.ca>, Tomas Paukrt <tomaspaukrt@email.cz>,
 jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 phone-devel <phone-devel@vger.kernel.org>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
 <20261114090737.64348-2-tomaspaukrt@email.cz>
 <7e36cb20-7752-4778-b068-56d41819f670@kaechele.ca>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <7e36cb20-7752-4778-b068-56d41819f670@kaechele.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/11/2026 22:49, Felix Kaechele wrote:
> Hi there,
> 
> looks like another take on David's patch here: https://lore.kernel.org/ 
> ath10k/20260918-ath10k-del-v1-1-53cd7a7d682b@ixit.cz/
> 
> Given that this affects a few devices (not just the USB one mentioned here) a 
> more generic fix would probably be in order. I'm also seeing this on QCA9379 SDIO.
> 
> Regards,
> Felix
> 
> On 2026-11-14 04:07, Tomas Paukrt wrote:
>> ath10k_install_key() waits for install_key_done, which is completed by
>> the HTT security indication. The firmware of QCA9377 USB devices sends
>> this indication for pairwise keys only, so the installation of a group
>> key times out after 3 seconds and a station cannot connect to a
>> protected network:
>>
>>    usb 1-1.1: failed to install key for vdev 0 peer c4:93:00:3b:6c:f9: -110
>>    wlan0: failed to set key (2, ff:ff:ff:ff:ff:ff) to hardware (-110)
>>
>> The firmware does send WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID for every
>> key, so complete the key installation on this event for USB devices.
>> The other buses are not changed.
>>
>> Tested-on: QCA9377 hw1.1 USB 0.0.0.111
>> Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
>> ---
>>   drivers/net/wireless/ath/ath10k/wmi.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ 
>> ath10k/wmi.c
>> index e57588c19c80..7d43a23017aa 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>> @@ -5339,6 +5339,10 @@ void ath10k_wmi_event_vdev_install_key_complete(struct 
>> ath10k *ar,
>>                           struct sk_buff *skb)
>>   {
>>       ath10k_dbg(ar, ATH10K_DBG_WMI, "WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID\n");
>> +
>> +    /* the USB firmware sends no HTT security indication for group keys */
>> +    if (ar->hif.bus == ATH10K_BUS_USB)

Hello.

I'm pretty sure it's not related to the USB bus, but related to the device firmware.

Check what firmware you use, add the `.no_pairwise_key_del_ind = true` and 
report if that solves your issue, I'm happy to send v2 with your usecase covered.

David

P.S. Felix, thanks for Ccing me here :)

>> +        complete(&ar->install_key_done);
>>   }
>>   void ath10k_wmi_event_inst_rssi_stats(struct ath10k *ar, struct sk_buff *skb)
> 

