Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFA03128A2
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 20:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187234; cv=none; b=RQxPOhaOxxbkE/Eko8fby7H0J5Azt8iT/kjvF+Ymc5TVa71WIgiZq0gchaMSeTIQK9lJ6pUTd+l8o86fQ5gs7+EfIba42038BayiKS4hJpEqhyGdJ1IbJe/ygua4+0prpJ4ZUWAbV8TNoprI49xC/csfJZTc6Pdfl8xqQgqXIOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187234; c=relaxed/simple;
	bh=9vUg0xkiSDkepEoN8IDASAjds+I8c1f9uvf6Obg1TMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJLFUVok9svAGYBDg8ORJr1cgVZXDohm5tXy04RTvuanNamd7gfbObHkBNQgJzr5FqavQWnoTibDgeBbQM4G6Vz00MLcBN3eVsFnO0/wR+s2WLDS6XE9NsaZtDTEDoEfZ8AhK8HE0gYMPirUVCJF78yjuYOhrWLwafp6v0aw8eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=QN6Q+Vye; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="QN6Q+Vye"
Message-ID: <68f52289-eb4e-4f01-a705-a0f490c08594@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778187230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6k+wfspzFKv3Ve/IAsYT1QG5E45d6fJFzLS1REhNuj0=;
	b=QN6Q+VyeR9Ug7qTHsaWRnn2Z4rpxVKz/eOGs4G66Weqcf65haee64UAIQ4zdhXGPtRbIUU
	dv0/QsdrEhJYzrwK4eBSKhhIrgLR0tOuDeCi/i/NN95Sib4pksKgEmyss3NtYr4c8JKAqq
	cA7wGyrIlr/MQtbb+YdvHokKPRuEmhNFQc5IhyNt8pc3iFAuCoh8p4G54VYkfAYoFzc/cm
	jayyTIy1QOJouGaxHNcLFmtCW4evQ1LgU3xcAWVD4fPow2DQ8zMeYx10O4gUCRKQ3iAPYa
	9wNJ4aTo0GKOtTi8ucnePrUZzGEMRbXykWybAjhwsnKVV7jBCPt0LYRwFZwZEA==
Date: Thu, 7 May 2026 17:53:34 -0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: arm: qcom: Add SM7325
 Motorola Edge 30 (dubai)
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260403054417.167917-1-val@packett.cool>
 <177818606041.73000.17657106462085102010.b4-ty@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <177818606041.73000.17657106462085102010.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/7/26 5:34 PM, Bjorn Andersson wrote:
> On Fri, 03 Apr 2026 02:33:08 -0300, Val Packett wrote:
>> Motorola Edge 30 (motorola,dubai) is a smartphone based on the
>> SM7325 SoC.
> Applied, thanks!
>
> [1/2] dt-bindings: arm: qcom: Add SM7325 Motorola Edge 30 (dubai)
>        commit: 839d20f9f3da93f65c000187ee68387598bdecb5
> [2/2] arm64: dts: qcom: Add Motorola Edge 30 (dubai) DTS
>        commit: dd1316efdbc5a998b901b1c5f27da73d45060795

the.. v2?? but I've sent the v3 yesterday :(

~val

