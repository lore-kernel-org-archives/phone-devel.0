Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21EC3CC315
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 08:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536894; cv=none; b=U9QBxtxEE32mhbbxy+MYz9ySH/N9lJUj0vMDhbzwRdvMnejQB9Iz8p62ihBMXyQXJQ60pyxirkWeHhH4IibW34/HTNRfitJsuv8H/m+rlBEJ9yriFcxBuC+5zvHLPJCKgDvIsGsLlQXO5ogO/ip5LT+8nUM8x1QbLcpUovRy+xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536894; c=relaxed/simple;
	bh=XzO/Thq4u8jivFiauimxf1OAICu2UyepNkrMhTjGQvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTMqkGX96Po/rkYoirUZdFzeeGYffQIJ+pYDmGu6RRQ05jW7/DCnqxGujTjF5MI2wRJKe/fIUzPHfcJOp6OQcz36BY7HBqR9MYINv81pbFpBuLnpohjYYmY8vD1orERIHQbaSm/+ZRGyHOTD/WjIEj7DYb1NgoMHPenv6MhtGiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuGHuX6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYD7hwuH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuGHuX6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYD7hwuH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7rgAT2979977
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 08:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vtmk5QDb7NpILPuyCS+NFxf+tPdClvCNWrRG5T+hRHc=; b=AuGHuX6fKEVuB0ju
	SHtGHoj+qPxPBXu/3mIetCPM0zyizgpy45J47NpNT0AEQGygb4uEHx8xNuR8WzqS
	/9WNH5Q2zVX9X5asTUuKYIkFV2Z9h0KTAPuteUIDWaJfiIUUmKC+j2vgLTb+r02x
	HvX1rEn8XR+6UNnQ7Q5z2O57K/k0bBeh0FpdpfGqbv976KunCRdhV+QNMVS522wL
	mTiYOhMgOmNXwiho2d41b5DdvPoGrcO3BJEr3X29UA1O/yTA3Bz94ddup/hPR3CT
	4am0Gf18acVOYQct4oUGUAy+QkBvQ5XPXIISCNNOmzldh3qA7zgIenesrBj7+TQe
	WsdI5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg05v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 08:41:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so19978661cf.2
        for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784536892; x=1785141692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vtmk5QDb7NpILPuyCS+NFxf+tPdClvCNWrRG5T+hRHc=;
        b=GYD7hwuHhO4pnrEkGj6RqMV+UYN1dm6p3K1clEGfVh2AJZSQme0NLKFHXSDMYk6lpm
         ttZjFTjB4CR888l0j43GRUJqse8fpaC2xVYdk5th4ymHGgduQSk7RopE0yo8os5Di8Jn
         HpSXdqpGg2Q3tA8KXPyXRygYk8CldXG3VeTJDJT2ilvbKcGYfnbU7KpgP5vkOWY57ef2
         ewdZQJF1bElirOp13hF4+J6RVxJq6f4zX6DBy1yA7Fbuenkio0vOuK3dTJxiqEu/IO2l
         1QIR0radNgMCvLpwJbEDjVtVi+9moJsXJhlR0lBdeow4b7vZ8NaG33C2y7ddr4l4wHFi
         IeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536892; x=1785141692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vtmk5QDb7NpILPuyCS+NFxf+tPdClvCNWrRG5T+hRHc=;
        b=cLQiw8EOvz8ujgqluYINktvA1L9WGDVW+lf4iFO0gAqK7ElS+jSQkx5FlHa4UxjEVh
         9lzdo4wg2D1BDgDkw0JbKFATgyuQWJTDsilxj5R4MZPlVaKUXiwjdQHCRRu9GTyNZRBV
         73U9QpoYwKTkBfmtG6IHeAJJhPp39wkEZswU8Iwf/yQgW5cBDiD6PHW2CjeHYpfKfmgP
         tlBzDVp29gPz4ZsB+8d7ASDDVRG6kUlfHbwEbBfxwtVLYmd2LgM+/yYcjwB1FK/WJgXl
         JmCYGGkPqhjYZHPmnqsFYzyZnsQ17v9UcsEi+6vphEIOsN9cfHxPqs64QJefAfYvppvV
         6kmg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2I1j8Q5tsqsEQtuZt4QQD8khBpi9r0kVTWidjZ4bROBnazwRiip7Y5KG2cGDBtlAuSh8FZVeD5NBJnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs8Wrxi4F7+ZdQMET04U2Gz21nvUenTCuYmADnI24Dng9W6IMk
	f8KqEsRcgwbGmXRA1KDTYPpbfHtf1/K3RvHWDPhlzmfinOcbWTNzWU+eeU4lmhsKYSvggf4hGbA
	8asJ7r4e8boeX8Zclquz4B+/1kHKsKGp6R6cjQDfxhfKuai4gSlX7h3iwOfOlFV+nMA==
X-Gm-Gg: AfdE7clA4JcZ9VPPpCqn9G482Ou8RVFXjMKTpfQj6Ac2SewU3GKxryEA9NsM/ngHzW2
	/VQ4rOWFo1fv16GGuFA4JjZpY6hE4XT0+a/0ix9qlLIx0Nun7XbTSxLkzGC3hSqL28hQfID/kWf
	lgFXPaZM5CxTpk9jjJkz9pCDX9G9xrp0C8RgiO4DquXEIHMKHB3biSLBJ68qb4NsdpnmQyRzLlO
	e1oJ8PaRaqoPAzfieblWyWzcSpPseZojyiShSYEyP6n3H78KgGSjyaw4YffCy5WfNavzhB+snPL
	AvqpFY7pQ9gxE0Yp9jTIe2NXy1V+uA6vG7Uz0HwUOL71oBu1baWs4rEXA3Sq9zYa5UtLl8fjUSW
	y7JstSfE8DJP9Qygae9ACnBWv
X-Received: by 2002:a05:622a:a993:10b0:51c:d8f:d77a with SMTP id d75a77b69052e-5213af574bdmr76330981cf.1.1784536892094;
        Mon, 20 Jul 2026 01:41:32 -0700 (PDT)
X-Received: by 2002:a05:622a:a993:10b0:51c:d8f:d77a with SMTP id d75a77b69052e-5213af574bdmr76330901cf.1.1784536891688;
        Mon, 20 Jul 2026 01:41:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fff5efasm4464224a12.26.2026.07.20.01.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:41:30 -0700 (PDT)
Message-ID: <c311efc3-7dbd-41aa-8b36-15afe85088bd@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:41:28 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add vbus-supply
 in Type-C connector
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260718-ginkgo-vbus-typec-v1-1-d5ed0aa6b78b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-ginkgo-vbus-typec-v1-1-d5ed0aa6b78b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NSBTYWx0ZWRfX8I/ljHqMFYs7
 W3bTVinVPWjV1/WpqYabye1u3DFZgBb7iLum+PHRavuEDTRaiwjIlXEdNOS3gEFtXnoqFgPCGa8
 sMGQrMo28ad/RIGVAueIXhOZApUNH00=
X-Proofpoint-GUID: KqAyrIYXomF463mf1EpXP492x_ETx7Og
X-Proofpoint-ORIG-GUID: KqAyrIYXomF463mf1EpXP492x_ETx7Og
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5ddf3c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MzIpylJLnEosbEr0IxwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NSBTYWx0ZWRfXwpEC95eWwjSP
 azDLyMlTFWo8Mvhju4QJj1DCER7P+XKh8212PVFZ+l5NU0i/Mp3nqxyyNQzOhd+10ndUjAgOz85
 KV7ZMNIFO9iErupkFOuo2oiGyG5Qkkz+laTTE49KRtWiXTFK1Ik663us2mpDe7GgRnnwDRi/s1Z
 605s7YEQuPGI+s32f/8z5nKp/F7DySy8mPUJ1em9ZtxKBPvxZHFAi4epO2swvn80swvdsk9d/oW
 pKSSMsiuJX/366+FFvITbwM7umq3gzBLCg5hZjG7ZFyFpMukTxi7ag4wqJ2zeBEv5VTk+VbxXFt
 sUouMQymGaV5nSXHGv3fA+82Mpq5p3g1As39wLJOwtYP4hpyGeHd2FF/PMbHSKjvXz/Ajj7fAH1
 +nVPfOdiodPjoqChRMgGJbHhqWrvAxB0DN0upi7otJ0AE6q2LH+Y6P8WcxMfSvJUpjnv34PceJu
 DJH8RPT99GGY9ulyKlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200095

On 7/18/26 5:21 PM, Biswapriyo Nath wrote:
> VBUS supply property was moved from pmi632 typec node to USB-C connector.
> This fixes the following warning in kernel message.
> pmic@2:typec@1500: supply vdd-vbus not found, using dummy regulator
> 
> Fixes: c1da9374c3e0 ("arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property")
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
