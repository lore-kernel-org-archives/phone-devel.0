Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9A52EEE98
	for <phone-devel@vger.kernel.org>; Fri,  5 Jun 2026 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698015; cv=none; b=nzcj3tRYWP7oxfnmXyvHQb04C//hr+/GVjb1tf9+8VJYB3DloTh8D2DGvkmF+BIFMxN+X36eTymEmud4sp8EIiYZ+m9A7eZx54FgVEg+muMICPhXAauudCIx588nJX18IIboXwRLqMI/z9V9diUeJxwxEeT4yA4SoTntaSp2DcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698015; c=relaxed/simple;
	bh=/fJR9ObIjB90E/QkVHybSi2y1A5XCak5hCNjolyBIsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIqA+cDiqMM4Qw0y1oh3bdaDfKlPcfRJY75LRdt73OlSFCUkqzkkuwyECRMRh0Xq3mUnG5nEZ1yxQd1PuKgEhV3OXsS99fl7OJjlIunnHfLeTOD46Be5LBeHbyT4gvRRVgcN0gRp4L/iCqOwGJ2vY/d4mNCTBOsNknMwyaMdxfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v9qFIcGf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v9qFIcGf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so1653382f8f.0
        for <phone-devel@vger.kernel.org>; Fri, 05 Jun 2026 15:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780698011; x=1781302811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/HB8G1yTQPOAvgzKZeKYVge98Lt9ZnLKHPu1l7zZb4=;
        b=v9qFIcGf3AzlWTMlJODbm2DBzIdu3pdSB9KlLvoOgaTA8nN64Jb61RDdKdVCLNgnlM
         aCDmRUI/U0Ee5CwyRPjMDWUvAliXoPY3dLNnLzswOQGKmxsaS9bWrwleM9TzZt5WfgV3
         cmJc5xsjyi4QT9RQC03L2Boxtr1yu/xacJ36vkGXcKV30BA4oRpCHJojx/pNdDyrP7Nq
         NTKAv9ZXSJB4H5gPlX0xc4QfP5CTwI83/Fy0A+5V9skGxkDCHOjRjPOm9gmxz5LRWKUw
         OoAqeGVMiO7VRAt3p+7mhdL4VMqOps2D+kBzKZQH/ijRjkXOSV28ciC4NvxcZlkfK9Jy
         lc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698011; x=1781302811;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/HB8G1yTQPOAvgzKZeKYVge98Lt9ZnLKHPu1l7zZb4=;
        b=dw1DWVDLznaVRH9GoBL9+Dd5ed0VSxreTxc+I3RBI/++Xvrxr27rBtmmKzz8q1WOi3
         k+sZ4aoPhKC28Kdfy4gYqqVOzS9kI6RarQtqdOefyQ1CbldjS9cevi/kbKOe96DmzsgJ
         c8EMD4piJlkv3iHWksIyjRt3jfJec5BAxY+rTNxbtC1uk0J0QOmz0irt6ghK/DYAa4E1
         5wePqdOy+lSJcmXG3kwGWmuPCyG4/saFex2FJ6ux0ZyjgJwCbNKxIVpMT+YAEFfaQhn3
         oF1A1RSIrXmF3+SGhflGoyILgZfy8AKP0BGJGiWqskiqAR6uOExa4OzvzdxKK9DbVjrf
         yKCw==
X-Forwarded-Encrypted: i=1; AFNElJ9NB3iCkY8rskn2qNgfO5A4i3JUFu/AiHUg3AkQHC4UYNxjF5mosWovj7zDmbKC98hewAHQAZBQ+7NTlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrB9JBFAip34vlPuw5gN0SSKrchijNhm/K8ySngURIMhewfR0k
	wPrO87nG/G8ZhV27g5mIvxkTRefVMB6I05/vQLZqxB7KO9xVKy1GKrQLZe0E/sI2i7Q=
X-Gm-Gg: Acq92OEYOx6j+VvT+Le5tMycwyoYySPhLnryHye12JwpAcpC0Qe8UnzUqZ+oXvnaTO6
	uPyEfF98cu//H+qNmFrwncqrEAezRzy48oDQXJCg/PcOqHQgt/lmJ6+HcY3PSwzeaxDhrK0AgtZ
	vFfoNK3784Hnof4BUAcXC+pvTkCPH5osoJ6gPxsPR1xaWMPhTXDMQMp4XZfmuQHl6qncmqVmLDB
	cCrm0jxDjswbi4OoMzYXgPXWWzBLst+4QH3snX1Jg9TM0dp4j749/pjeQ4pq9e0A7RJwmuUdo1L
	KCfKNvCzOitOBFWiHF4/Hnu4dzIzFxO+7DvbJv+h/Jx9ipvskoEz+V9QgBaCY2ZF0SIGgFublX0
	tYH95oUZ1/zurcfshxJ13WR7wDzoMcRXLSxS7G+1IUNjSO5A3z0NgUcmwnx/zfceDtOTjGOQfr3
	gLWE0Idu+MCyjLEfZjzLjDnB07Cv4pKHMzCA7+Eaa8UmZJ
X-Received: by 2002:adf:e743:0:b0:45e:f1c5:709 with SMTP id ffacd0b85a97d-4603076cb46mr6547079f8f.37.1780698010560;
        Fri, 05 Jun 2026 15:20:10 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.32.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm28849253f8f.26.2026.06.05.15.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 15:20:09 -0700 (PDT)
Message-ID: <87ed4bcc-aa66-4a1f-becc-7fce1fe795c1@linaro.org>
Date: Fri, 5 Jun 2026 23:20:06 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI
 CSI-2 C-PHY init
To: Michael Srba <Michael.Srba@seznam.cz>, Bryan O'Donoghue <bod@kernel.org>,
 Frank Li <Frank.li@nxp.com>, David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-5-e50de0b557a8@ixit.cz>
 <8azU3NvUdGCvWCxLb0gz7FWkTGFL4k_xiBUPp170jiYIQjwHyRqynP_oLG4pjFkIRSY_bo91FQh9ECYlXdXrsw==@protonmail.internalid>
 <aiCiVe_LRA4DXTCL@lizhi-Precision-Tower-5810>
 <8b9f8754-48da-4b61-84b8-3688520c7f63@kernel.org>
 <c7f35621-2bdb-4e66-ac8a-6c7fc6f80f1c@seznam.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <c7f35621-2bdb-4e66-ac8a-6c7fc6f80f1c@seznam.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2026 15:47, Michael Srba wrote:
>> So, hex values from downstream in this case are acceptable.
>>
>> OTOH vendors can and should enumerate their registers in an upstream 
>> submission.
> I thought this was the policy indeed, but this made me wonder if ALL the 
> magic numbers
> in that file were added by volunteers. And weirdly I found this:
> https://github.com/torvalds/linux/ 
> commit/7803b63a1640a0a39e3ebad487b33cb2d26e778b
> and possibly some other commits look like they were made by people on 
> Qualcomm's
> payroll. This specifically is QUIC, and idk how much documentation 
> access they have,
> but at minimum I assume they had access to the CTRLn register names? 
> (fwiw it's entirely
> plausible that the registers don't actually *have* better names).
> 
> I didn't follow the relevant ML discussions, but it seems to me like 
> they should've
> been told to document the registers?

"That money was just resting in my account"

There's alot of technical debt to digest, which I think should be solved 
in the new PHY API driver.

- Move to new driver
- Start enumerating registers correctly
- Transition to QMP PHY levels of lane config instead of long lists
   of "mission mode" writes.

If you ever rent a car in Ireland and get lost, you might ask a local 
"how do I get to Tip from here" and we'd scratch our heads under a flat 
cap and say something like "ah well shure, I wouldn't start from here" ;)

---
bod
