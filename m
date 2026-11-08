Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166876;
	b=R/aSKvbxDKfgWnoS7BMs35/nhNWCHXawSH5xlLyOM3azuPXCLWAJLXIdVn27Tk3jY4l9
	 8Pd4bY6W5f+Qr81G71QOFWIS8cWHRAIOMCfvGPashf7Z4cnUih0M9Jjq/kGgSXbygrauG
	 JTZCyW2BrqwX95cr2RRsBustO1dv2159k4ieSNlRSk/9dLfUYRuehcf2+OmaXao1S7Xi7
	 dVG/AjYIblWpuMVYnMuAFcg0FQqLI4AIFQuk0s9SQf3r84s0BzyCK6GQ2KejBky0WFJxR
	 QI2y/vwqZlUTuTmc14HGYxvfOQzsi0XxARY5/P7Xai098nE1jVdXqoKxfBhcvlRowOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166876;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=804cY5dj+EYM+fofEMnwIGoD9r1pDnjArHDnR2JIvus=;
	b=DIGupA6r24ug/shBVy+Oe8Npz7y/3QP1Sj2UJ99c/94XCSTAvz76FCr3+yCsOYYw98+s
	 3qBRQnHrp+tgZOOVQVqBeO6UmZUFJscPnKRwPYsAvHJCCNXcKxF3SHdsfEik0bqyCMKff
	 9faOYQvUGzmcg95/nq7K0nTG4lXwe7QPP7Ou6EcO1OukBBLfTp34iQTLreILAJqCRgZkn
	 SKTeEqpDaz/hxyVTDdF/aws0fYZUkN4GNMzqtoSN2fEuQME8COv/ITQsirlm57T3oSEKH
	 TH1LthI/yNMNLSlc9aWKwnTF7k7TAMW3O/WEfIJFWoOAtmU6RRtjdo3BPE7DLyeIWFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b="PL/7JyOs";
	arc=none smtp.remote-ip=91.218.175.187
Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09179606A323
	for <phone-devel@vger.kernel.org>; Sun,  8 Nov 2026 19:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09179606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=PL/7JyOs
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ibChZZZc2dZaS9VYrz9L6vfKqhjux9y1wuYa7AtP0NE=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794166872; v=1; x=1794771672;
 b=PL/7JyOsezqgVF3IwQ+pitRowrrjp7bIiXxmfbo3ggV0lk1tDprpELaC4nvK6MbCZCCisEPX
 M1oB4JScqze2diY9VMCkczfYiaCjqFP+5L77MUNFid+TBGph5nALekK66WwMOC8XL+uE7yInklf
 C6FChInWBUvoxlBm0g2wN2YomUCfwVgjYdVKorTgpfPrERrozzH17fdQ9U+lqcUubg20xKu36mn
 SL7VGvwebvoc541BdaCcy7qg3MblaQ3iEl0z8CO0dLeXamoSzAN8WfSq4P0CngjEPjVlPKrlk7I
 nr9GbV4x0WNpt+z0KumjjM0t7Z5Gj0aZDO3LgSIRp/+8w==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 565880af2e2fdaa3;
	Sun, 08 Nov 2026 19:41:12 +0000
X-Mizu-Trace-ID: 565880af2e2fdaa3
X-Migadu-Flow: FLOW_OUT
Message-ID: <5b965360-7121-41ab-94f6-d23b3eace32f@postmarketos.org>
Date: Sun, 8 Nov 2026 12:41:09 -0700
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
Subject: Re: [PATCH v3 2/6] leds: aw2013: Add AW2027 support
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>,
 Alexey Min <alexeymin@minlexx.ru>, Nikita Travkin <nikita@trvn.ru>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-2-cab1fdd050b6@postmarketos.org>
 <179198402838.839288.17911568760182808689@kernel.org>
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
In-Reply-To: <179198402838.839288.17911568760182808689@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-20 3:16 a.m., Lee Jones wrote:
> This is hard to read, I think we can do better.
> 
> Also, does it need to be a separate helper function when it only has a
> single call site?

The function is marked inline, so there shouldn't be any performance 
penalty, and I gave it it's own helper function specifically because 
it's hard to read, and giving it a name helps make clearer what it's 
doing. Do you have any suggestions to make it better?

-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
