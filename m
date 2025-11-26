Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101552F362D;
	Wed, 26 Nov 2025 23:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764198624; cv=none; b=Hrxz1Xp9W3OCZMoXpwx0XL9DDsCElBzncCu69pFr5xpb3/7wCUKQ4gSlhG3tRL0T1dzUzFcCKNlPXf5qk7Dj1+24Gi5bKur5+3AYnMDU4isvCmSYIOfWAhUbpdYdxCGwdYm2/3thXxum7IaDKxChcMRrC/UWMPLhIk1Q73B0fCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764198624; c=relaxed/simple;
	bh=5MWoLLwmgBn7F0grOP4JczgGeM+YNcb7bwTzftPtVks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kjk6PL+6dU1G1qq2BcbOEqYc42qb/AszneAbdlZelFjRE9obHMXw7jMqnuWcGYn+KAJxo8dPK0ulqjF1ykhDwM9/z2P4rbuso4vbkNyJw7EIh9WkekAdncAoXDcvebp6P1b3JPFC2c8WpmVklY+67nS1F9oAAoGIs0DH2RpHoeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=tDHvVjlk; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="tDHvVjlk"
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 57F865340144;
	Thu, 27 Nov 2025 00:10:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1764198614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NPueFMP8zr9ixlLxuRFFtrM4qKgsXQNTW6I5E7fZYTk=;
	b=tDHvVjlkoK/0Syp2CpMFQaIpJsH6m/6ARly12dyRYOO4ZqyLgWSiSaHrGSsuT8XNLaTvQx
	s5bQwWwSdNgUFDs87aCmVEdNJb9D0m7o/Q7saD4fnCSm/zhj6hNzhLFSISNs1Bs/gMIP0A
	Q1SERYTjnu5z/F/Jz2qeNOxDRU8yxYg=
Message-ID: <3e808b6a-9dba-4b48-bc39-c0a8aa674d24@ixit.cz>
Date: Thu, 27 Nov 2025 00:10:14 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH QUESTION] arm64: configs: Add Snapdragon 845 config
 fragment
To: Catalin Marinas <catalin.marinas@arm.com>,
 David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Cc: Will Deacon <will@kernel.org>, Casey Connolly
 <casey.connolly@linaro.org>, Casey Connolly <casey@connolly.tech>,
 Joel Selvaraj <foss@joelselvaraj.com>,
 Alexander Martinz <amartinz@shiftphones.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 =?UTF-8?Q?Pablo_Correa_G=C3=B3mez?= <ablocorrea@hotmail.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
References: <20251126-sdm845-config-question-v1-1-ffa91ed53095@ixit.cz>
 <aSdCryMAOb7Qk-qq@arm.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <aSdCryMAOb7Qk-qq@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2025 19:10, Catalin Marinas wrote:
> On Wed, Nov 26, 2025 at 05:19:20PM +0100, David Heidelberg via B4 Relay wrote:
>> From: Casey Connolly <casey.connolly@linaro.org>
>>
>> This fragment provides reasonable default for the mobile devices
>> based on Snapdragon 845 architecture. While default config could be
>> used, the reality is it brings many issues to the development workflows,
>> which are much harder to address than on generic boards or devices with
>> available UART console.
>>
>> This config fragment produces the .config used by distributions.
>> It is designed to be fairly minimal and specific to the
>> supported SDM845 devices whilst offering all the features you would
>> expect.
>>
>> It disables other arm64 architectures to speed up build times and
>> decrease the size of the kernel image.
>>
>> To generate a .config use "make defconfig sdm845.config"
>>
>> [David]
>>   - Dropped distribution specific options.
>>   - Added entry into the MAINTAINERS file.
> [...]
>>   MAINTAINERS                      |    5 +
>>   arch/arm64/configs/sdm845.config | 1048 ++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 1053 insertions(+)
> 
> I really don't think the kernel should carry configs other than the
> generic ones used by developers. We had this on arm32 but mostly because
> we didn't have a single kernel image for a long time (and when we got
> it, it was mostly for v7 cores). I don't want to get back to hosting a
> multitude of configs in mainline.
> 

On the arm32 it was custom defconfigs.
Here we use default defconfig with the sdm845 fragment to accommodate 
mobile devices (e.g. `make defconfig sdm845.config`).

So far, I would say phones based on sdm845 are one of the most popular 
for daily-driving, thus I think giving it extra care until the drivers 
gets rock solid to work with default defconfig would make sense.

We could have sdm845 config in a separate git tree and developers would 
contribute to it, but why not have it inside the mainline itself?
We have the SoC, drivers, most of stuff  needed to get the phones 
running, why keep the latest piece of puzzle out of kernel?

One of the best outcomes in long-term would be get rid of it, but we're 
not there yet.

Example: In -next tree for sdm845, I recently had to enable 
`REGULATOR_QCOM_REFGEN=y`, but that means I need to communicate with 
everyone else trying to use sdm845.config that they need to enable it 
with 6.19 or their -next tree experiments.
If it was in mainline, people carrying custom changes on top of sdm845 
fragment or combining it with distribution fragment would get it 
together with 6.19 prior without effort with clear commit why this 
option was enabled instead of fixing/squashing commits.

Do you think the fragment could cause some issues for people working on 
things outside sdm845 phones area? Or the concert was more about 
possible precedent?

David
