Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174675;
	b=C83lOYuLUD/BCTGUdNZgwI3ocForiDlQ1bdEDVPaWA0hHfId2uKRjCVVWpqGpXkiZqpa
	 6S0JbcyQT6G1DyK0W2l2jteuPVU+WeB1xTL2aHaffLdmRWkpz+YksEkkEE8OgaBfs33Yl
	 OPvCzDFVTrgyj7kMaxEhEz0rKsJ+c4iYv0qqsickDzizA7QXJ9eOoos7Hd4fMd7UvHLGW
	 nWWzKKGyR4WIzzPbPsdgKTGt4uGXQEmW3Hn7Ghw4Ws8DDjziffbou8AUb5NzXEupG7CUR
	 5lu2DWaV3zENFlZGxQ+DwNj5F+p0ZgAo1n2bGj1PwW7a/mjeaoVEMt/8Qb0busWJXZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174675;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kpUONmbT7hWv2Y7CdQy5xxfROFTeKUAU2jyoeqsZvoo=;
	b=rHSlLf6cS1tsbvOGo3pkqL1njXHE6ExZmWc7fQ7fZf5chbY0qWqLuUpTZr2eW/D0Q7JO
	 bnh+usLbp0eghkhUhfXfvJ16M2oJS9LF7O20qIFbMQslDTzkbIbMIZE0sJjhYwC9KvdrN
	 X9maJq6tJU4Y+KUpbgVJ7Hxs8gDS6t2ZO6bB9zXiZE/KVcnAp5hfbdV1BmxLBbB9vlJ8P
	 7/Sa5OweE/5I4xGpFpp+QtWC6B4g62etiBEQdWAw1OPUfytmLOJkl6TO+t24kf3iFXAit
	 ZMTU0/JGocYd44uuoTmqeMo2/U75YduNLhIB0/k0h6ehSB43j1CIDgPyrWA1HxjXGmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=rhS9qumP;
	arc=none smtp.remote-ip=95.215.58.199
Received: from mta1.migadu.com (out-199.mta1.migadu.com [95.215.58.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D220606A322
	for <phone-devel@vger.kernel.org>; Sun,  8 Nov 2026 21:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D220606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=rhS9qumP
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zn5fPGHHigpvJLucCOlqEpjKvVEKZ9N35Myfk0UnTS4=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174673; v=1; x=1794779473;
 b=rhS9qumPmAGrvfxmodyYdbUMW6q8h/Jgz3LA+O6NOoGWfHCWW5/dtSjtMisFwWTIjYKb7Y8d
 nnqNuG/Y0XB7OP5rfd0+GLHJ47RMOxS3uuGWjpEPsgXvc7LAKrFAji4/NLa2EEf7BLBoqgvTPAN
 zJoFeKtzdf9SgQQgkXMQRsDkdRkI2NCPA7lONapwYdHmbz5XblqDNIsSrZaTyKL9wxBGlRz37cO
 0BeL8nuAFlh1x+ZBmsThWnuGNzNoE1XHovVkYpNt/AS5NRN4wpap8jC3J6wkY7Zq4pYy6rL5bYQ
 VTQ1DtocTdr3PVOmpjJZr5oizyypR6LAq7VRNUQslf5Fw==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cb03e027439b5384;
	Sun, 08 Nov 2026 21:51:12 +0000
X-Mizu-Trace-ID: cb03e027439b5384
X-Migadu-Flow: FLOW_OUT
Message-ID: <6f59d8b7-a4d4-4cf6-a6e8-0cd1542c44e1@postmarketos.org>
Date: Sun, 8 Nov 2026 14:51:09 -0700
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
Subject: Re: [PATCH v4 2/4] leds: aw2013: Add AW2027 support
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>,
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>,
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
 <20261108-aw2013-aw20xx-rename-v4-2-826529beeb52@postmarketos.org>
Content-Language: en-US
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-2-826529beeb52@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-08 2:49 p.m., Paul Sajna wrote:
> +#define AW2016_23_27_33_CHIPID 0x09 /* vendor shared same chipid between several chips */

I'm not sure if I should add compatibles for all of these variants.
I would only be able to test 2027, but they should in theory all be 
software compatible if they have the same chipid.

-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
