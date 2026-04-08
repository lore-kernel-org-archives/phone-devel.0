Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0023AE70A
	for <phone-devel@vger.kernel.org>; Wed,  8 Apr 2026 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654809; cv=none; b=etOce42GMjSnT/umCjcUxFTH+A+JhSPPZ7iPxyo/l3IKvJdeaBn3Zy8LJ/AaQls0odUBnPSCvmkVyhlP34rc+FnPsmR0LMx+zrBpbhPUdz5pJagnfbTsn6tWnRk3W7iC0yNMLnfX5azz++OZpc3v3gP/LrhlNqIpsB4LjvPg8Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654809; c=relaxed/simple;
	bh=31+Nn+H1zvkXMEJm7djV33Cf9S+18OFYs4CwkmVXFjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5cdUcQWIG2dUTcQHS4DOOjv4X98dVSxe/yMHA9Ukw6y5Qr7cfcWyI9d0Ti/cnu/l7sryc+Hv16DYqyWwGZAK71xtClRmoWL1S8nnVJ84tue7YqDFY2xi7NJ4GUex6GBwZ/aPDL84IXvWyW/hBS3pVWyLyIqNgVUCQI5OCkjTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHQ441be; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiCFG78F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHQ441be";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiCFG78F"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638CWtxk2860736
	for <phone-devel@vger.kernel.org>; Wed, 8 Apr 2026 13:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUsI0vRt/h3JRrI0+01jviA1yqiyNxPW3ZUL83X8HrI=; b=AHQ441beUejrIpys
	SHlVQUTy4Y49IKQyqQaWNrdqhpAJi0Lxxr6xUhIGOj60a4oHca5+k2s1c78VV0v4
	1p02lw6jeWxmSBSj1jKXW6PujcomwaYCZQ7W81MAm+/eQ42Sd8pvnUYqeUM4//gu
	bXbCRnQCHGUNz4yJDXosi8iXKw+pP5rIi8jRclBE3++/Gw3tXECUiiiRe9usTq53
	UZ6k1g1HfffMpr1xUlXuMKOBtfW+B1oyEWTSPKkrMd8YU2Wnbyb1MavpqTg7OxSg
	mkJd3PzlrFZ3oDEV8k/MDGTzzsWqYaWwwWJ1d4s34rY0pBaUnx2BWvJOtkgFMS3G
	Jyyvag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8u0mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 08 Apr 2026 13:26:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4bd8e77dso10040111cf.3
        for <phone-devel@vger.kernel.org>; Wed, 08 Apr 2026 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775654806; x=1776259606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUsI0vRt/h3JRrI0+01jviA1yqiyNxPW3ZUL83X8HrI=;
        b=CiCFG78FtEa1+FVeWoThhvVu2r0qE9smTIn1+bNZYqUcXZ1pO7DumvEOIWDsUo/JWI
         8D9u5Q6fDtBQSa+uZ/S6TP5cDnkLYuJ5hHOtC+LTul2bK0W93gDSFFwY3UcjOnlAUFii
         EkD/JpskajK4zKvI+oOBiFjF+4ovx4zRm2sYzyFtktu+OzU79tYe6rkcj39xebsVExCx
         3o/KaGc3xoeI1rFdxKNxiSVAhv+s0wLm81j9UiVqKP07jwCJbg9dbwRHWS8rlZbLrSJd
         KAu0ugjupLXhUrzLaCDnP53zH8uoCLSKkESUmN74rXhjOqsdd2k/xcuFpXR453WB+WY5
         T+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654806; x=1776259606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUsI0vRt/h3JRrI0+01jviA1yqiyNxPW3ZUL83X8HrI=;
        b=AvuEU9N5tsnmycx3s0xXFDuzuX2/WQvBmqFRmyiHotayV8h+sKMaDOrkWTdS09b1Yd
         MumxWEeKx7ZqiIDw2nFLajJoug8bCwM3ndFLymDw8X47F6Whuva7KOmav58QrqDc/QHR
         Waup/+J2k15+hOk/efzXDPTUy7BZ8OXVJwgn86EidHaLIlf7HsPS7JM3HbTgKIfQFwt8
         GVQ0/YW15pZCNUr3tgKphksEtGG/p7JS2zkI7cyaQ52rx4kcKF/3iemWfrTDYG0L+f+s
         KS4Q/ZGHQ9PNOK85uqrKkbHaGB8RdBYx+zEzM3+R951GxInEIrDMV/pFk2pPHqnyqs1L
         49Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUU2CIWZoE+xjvhW6nECJ91HtglaomCVHCtSIG2B+XMkERoHBQh8iZcQp93Pm552dvfuKCKCCNu1ES3aA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8VYpEtYJFxevZTkL+38tYsgNJh6Q0FJ6R90Ih1DSG5ZqkAu5k
	3bYxKZixB1pRjroeDEwa/Q+Zp2pPfLuRzWNYGXkT5OARW5r5EtDB/ckxaOJ5bhwyagD7wOpHDVe
	zoRMfsI45S7fHuDLwaZ5/GDoH/qC8qQCMbipC2lbLrrBYar/4DyT8Lq8GJ6W2sHcQCg==
X-Gm-Gg: AeBDieu3Gz8Yw0mW4jq1vmbAKD6EYLrhFPPAIelsHJhg6QX1PE93kmeF26ai5xv6+x/
	jL7sIsgS0cr+L6CxrohqK2VK5oDCrNgfAIny6wcDDy8jKEDLZj3at6e8DrGxd2Tzh57tAeDseZt
	GsyHu3O5tGkXYSdEZ72KCiiCxUQUmdvV/QTIb0g/nBtKxu0trXZTKLfKX5tOgm9HeRPibq9xJWd
	ZsD7DKg5jok2R54c25p4g5FUJ6wcp66uaM/SdZJVXCJ5PsU3q4i1sUTLJ50rIDCnvN95eQ4f7Jl
	VV+cpU3+9FhewvPf06afBpDS3aPlNrUrxF6T4dZAJ3ZmvKGriazzj8ro16L4ODPLkbB7yKzEK5W
	nuHcjZTkOVQo0xPTHuNy2XsYBFX8crYPeFFzvdlxrNeuUBY+MREs58xLvMxb57OKuwqAbIo846T
	cGx80=
X-Received: by 2002:a05:622a:11c4:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50d62d30eb2mr224219871cf.8.1775654806114;
        Wed, 08 Apr 2026 06:26:46 -0700 (PDT)
X-Received: by 2002:a05:622a:11c4:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50d62d30eb2mr224219471cf.8.1775654805544;
        Wed, 08 Apr 2026 06:26:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028995sm646292166b.57.2026.04.08.06.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:26:44 -0700 (PDT)
Message-ID: <1a6e1819-cce3-4e08-8cf6-2cc3a8abeb74@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 15:26:42 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: milos: Add IMEM node
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
 <20260407-milos-imem-v2-2-5084a490340c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-milos-imem-v2-2-5084a490340c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6trGdFaVsVuwlQjB03ggAnnU1idrdriB
X-Proofpoint-GUID: 6trGdFaVsVuwlQjB03ggAnnU1idrdriB
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d65796 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=pLXVy_XSri54llwUxOQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyNCBTYWx0ZWRfX304B2kP5wbg0
 wtauiFmjjU/KUTRJpTrh3J+ZEjKKTHPvEEElg6LfegAoVglSaqxG/QCX1cDkjtxHc5Sw1yCg6QN
 iXefRSacjmPm9sHuvSjRY50tPmtdRkVY0VTNE84cJPsTTOwkMktaE6nemLonVUwE8o0y9d5LJyS
 sqSx60u24pFy0+2w6/CSMvsKCieyQRPy2e5TsOYlanJNN8w7ggogMUvIZdlSXDjgbLcPeC916fQ
 YMII205KlxG/aEXilzP5kn/LagjuB5miIIwYepZdGQA+6XLu2za56JAZPPS2r5WLfNMzfmqs47q
 d3l9i9H8AS5ykmLnxrv8XYCoofSs0kPKfMmOy8cBJSD9BWeYp4QPCqxHW0SowRzL0jr3/VBHriO
 reTcJq2c5wHtoL+e2LDwXsxQuc+3wV92VuE1vCqsQ15aBiV7MUCnX8obMSFLRqvSw3wZaViNeNl
 FVgR/drFo45JCIilT9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080124

On 4/7/26 5:11 PM, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Not happy about the names of the subnodes. pil-reloc-sram is not allowed
> it seems. Glymur calls it "pil-sram@94c", not sure this is wanted?

Not really.. I had a patch for that, I'll send it rn

Konrad
