Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95AE2D9481;
	Wed, 26 Nov 2025 22:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764196393; cv=none; b=PUekRIXyLtTnPKftM1qbZzCWlt5bTCz/t4o48wwBFMSUm7JD9VmUnu35OC6fqJILKrGtqx4LRnoc93CLs5y2is1/slIVXcCoX9F5b9pN6GnEUR67/3mlp0iGJp4qgvg4O2IL5TG0b6ZGXd5Fn1d2AnTwc2wgYW9tUI2hRdVSYNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764196393; c=relaxed/simple;
	bh=5jYpPwv39ANEIe2sDLqiq5t/hf+CQpGo3B6zSITWUfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZPr+5i08C6XbisuOCXPVR7eN/ZCgLHkUztzXqhQeYGkqm8b6czOMuYlGsmzQK7m0iSkt7cR/CPa8kaFOVBZh7hs3Cjth8elOGlTZpI7ZgXrwl2qVONce2M48RxvZt/y2qAkY/wMXT64P7eGyXyc+5oMFcGauwKuFH8XId8fgRlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=coLOGpXu; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="coLOGpXu"
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 73B195341212;
	Wed, 26 Nov 2025 23:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1764196387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mDzAY5BQNTDP+ZymhsBaphBdvEkLLREriCn5MDuFOK4=;
	b=coLOGpXuIFgIQyK824bTAuEq7YC6YLNMupKzK46/B5lSv8hlx0SG3v8vz5gKe3a4vGhDpQ
	29W0N54doDNwfk6MHd8qmvRU9RU7thek7Na6t9qENDRiWcFHPrDEB7Q9MpiAVsMlqq7qdU
	K3WWWvT7Uu5BasAHin6jV05kTMbin/U=
Message-ID: <a243e024-c7df-4a3d-a855-4738a4970de2@ixit.cz>
Date: Wed, 26 Nov 2025 23:33:07 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH QUESTION] arm64: configs: Add Snapdragon 845 config
 fragment
To: Casey Connolly <casey.connolly@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Joel Selvaraj <foss@joelselvaraj.com>,
 Alexander Martinz <amartinz@shiftphones.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 =?UTF-8?Q?Pablo_Correa_G=C3=B3mez?= <ablocorrea@hotmail.com>
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251126-sdm845-config-question-v1-1-ffa91ed53095@ixit.cz>
 <9c3f64b4-adb3-450c-b1e6-d6731b723215@linaro.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <9c3f64b4-adb3-450c-b1e6-d6731b723215@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/11/2025 20:03, Casey Connolly wrote:
> Hi David,
> 
> On 26/11/2025 17:19, David Heidelberg via B4 Relay wrote:
>> From: Casey Connolly <casey.connolly@linaro.org>
> 
> It's not the first time you're sending patches with my authorship and
> SoB upstream without even a heads up... fixes and minor feature
> additions I can understand (particularly if you're doing the work to
> polish them off and get them accepted), but frankly I think it's little
> unprofessional to post a very clearly "never-intended-for-upstream"
> patch verbatim to the list, particularly when it has someone elses name
> on it.

I wanted to use the patch as starting point for the discussion, not a 
patch to get things upstreamed right away.

I respect the original authorship. I wouldn't feel comfortable send code 
someone else wrote with my name.
Other remaining option here would be never send it, but I think people 
could benefit from the config fragment.

Here, I wanted to have a discussion (thus it's marked as [QUESTION]) 
what is the best way how to address this fragment, while not end up 
being separated from the mainline development.

I and many others see a value to keep this file upstream and care about 
the file there, as that would ease changes done to upstream defconfig to 
be reflected onto sdm845 fragment, when bigger changes are introduced to 
the Linux kernel.

> 
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
> 
> I wrote this like 4+ years ago and it's even more wrong now than it was
> then (not least because I eventually found the UART XD).

Yeah, but since then people continue activelycontribute to it, so 
generally it's pretty up-to-date =)

>>
>> It disables other arm64 architectures to speed up build times and
>> decrease the size of the kernel image.
>>
>> To generate a .config use "make defconfig sdm845.config"
>>
>> [David]
>>   - Dropped distribution specific options.
>>   - Added entry into the MAINTAINERS file.
>>
>> Signed-off-by: Casey Connolly <casey@connolly.tech>
>> Co-developed-by: Joel Selvaraj <foss@joelselvaraj.com>
>> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
>> Co-developed-by: Alexander Martinz <amartinz@shiftphones.com>
>> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
>> Co-developed-by: Dzmitry Sankouski <dsankouski@gmail.com>
>> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
>> Co-developed-by: Pablo Correa Gómez <ablocorrea@hotmail.com>
>> Signed-off-by: Pablo Correa Gómez <ablocorrea@hotmail.com>
>> Co-developed-by: David Heidelberg <david@ixit.cz>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> This patch is a question, if it would be viable to introduce this
>> configuration fragment as part of mainline kernel, so keeping it in sync
>> with recent kernel updates would be more straighforward.
>>
>> When this file is kept by distributions, it cannot be reused on latest
>> releases and for building latest kernels, as the options gets
>> desynchronized.>
>> I offer to maintain this file within the mainline kernel, and I believe
>> most likely some of the co-authors of the file will likely step up to
>> keep it up-to-date, so people who want to contribute can avoid fighting
> 
> The same co-authors who knew you were going to post this??

I assume people who made it may want this to become useful for others. 
If not, I said I offer maintaining it.

> 
>> with old configuration file downloaded from downstream project and can
>> focus on fixing actual bugs.
>>
>> In case this fragment gets unmaintained status in the future, there
>> shouldn't be any issues to just remove it from the kernel.
>>
>> What do you think?
> 
> I don't think it makes sense to put a platform+distro-specific (read:
> opinionated) config fragment into the kernel, any distro trying to use
> this would likely always find themselves carrying patches (sending a
> patch to enable a driver or whatever just doesn't scale very well),
> nevermind if multiple distros with different requirements tried to use it.

I tried to shave the distro specific bits to keep only the HW relevant 
changes. I think each distro can apply the specific bits themselves and 
keep here the sdm845 generics.

I would like to reduce the fragmentation and leverage good review 
process of the mainline kernel.

Distributions should really apply only their custom changes, not some 
version of sdm845.config fragment based on very different 
sdm845-mainline versions (multiple currently) or sdm845-next version.

How can we version the sdm845.config, while keeping configs from:
1. generic stable releases
2. generic development / -next versions
3. distributions optimized configs

IMHO would be nice to have one source of truth, at least for base option 
related to one upstream kernel version which makes the hardware works.

With upstreaming the fragment, we can use mainline and `Fixes / Cc: 
stable` tags to mark what should belong where without confusion.

David

[...]
