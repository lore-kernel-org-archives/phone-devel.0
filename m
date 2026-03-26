Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE4734DCEC
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518071; cv=none; b=eoR08DVKnn+L+SHguMEkSQD2Wk5TDhL81tlrQ6nBlTRoMOAqPjEigimdFtOglCemRvAxVd5UAqmSRZTvgUbGvYnrA251GonFmZTTP66u7mRTb6ENMXXoDkYdPQx0iGxy0RZaV+inCJLzLvR0aaBZBp4BT1ZcTEBRt0OH+eoY3+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518071; c=relaxed/simple;
	bh=Rv5UhyIkY7LTM34sVRpkamMs3/VFT2zqxDOaYbDuLtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RxfOK9LfuV4kVD0/irCzhT0XHra8bSX0fiVnY8pBVhI0KjIyQJI82yGrQF2/CqoLRX9h2Ohi71kT8C/xSM6B/E6jCMsa6c1v4bLOw8T/pzNQMEBqP0/VWs/8DRbS8HgYg6pN9avis7XrYlgKUqbmfFvsrWDjX66pEcyCl5eo8kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaPi3zxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVMQHxar; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaPi3zxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVMQHxar"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6LVdC1175513
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LMKFa/gZ/0WtlaOoCfp9i4fst9ROmtc3ezJMiPBlmEI=; b=oaPi3zxsIT4NpBYJ
	bw6CS2FHFtyBZGnNKrhUKohH32lG8VHBHOCVMkU8y6fvLtZXNRAeDYfxxdBNxyyF
	shi/PGumyUgX8zAqIoplLczOPvcHJsz/sXZBkSZvDvU3/YbMoFbfyPpYwNwRsUJS
	FRjWg+RTbtZw7YeWwsEEMoiijjqCaTOf+T4JkgCSZvBq2+fYalM6D+Pd6L0s2VDt
	1zqnqlFeWRlQyf4czl1XmQJAYI43vXKajhROZcidfgUGOPp4Xf6h+j9/GK5NcvbW
	C295A7Qs98awyd0lxLIPjbmgvonGH5U5wR2gSrh+Ker83nwPEHASs1yX2owQVr3A
	LuG85w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76t6w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:41:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2955cc1eso2249451cf.2
        for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774518068; x=1775122868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMKFa/gZ/0WtlaOoCfp9i4fst9ROmtc3ezJMiPBlmEI=;
        b=KVMQHxar8DN1/nJ+7oXouR00s+WFPPsWK2bfGclBC9dscbW4/+AAmuel6L5/P3IN53
         vIgJSOcs2MbDxYMDsuf1O8z5vqGruqy+rTvpuT7nA+3UdN1D82OkXvYlngT7jPgS0nh2
         YQXw6XKHfjiBelglmQaxfDdCtyKeopGlbsS3udZybHg12b6pSNgcKd/0eK70g2pfOXQ4
         VdeOU+K3eOREsoA+fpEY6IZPYPs6dUe5CR+C9G7EdfxnmPJJyQHVqXNJr7HZGGMs6hKz
         Zri2OVDm6rGJbJd459rMxQw7dAHxI2XlxP45B2JngJn1BSvohMUndbSdsCxOxycneDah
         amuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518068; x=1775122868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMKFa/gZ/0WtlaOoCfp9i4fst9ROmtc3ezJMiPBlmEI=;
        b=N5EFBwN8yMUYa7tzljSQpWpa27BOIkp2RSJVYwTWKHfp+wmPLTluKu9FwOzepTpJsQ
         qp2JJeDDhrBu+Q/h7j5wkk6x+FSN04kAn5pyZr9m9AkS0utq2leWZIV4PEq0FgPnaXEF
         XZZjTmPwWR5Vg/Cl4IXkEk6e8DgbekTs+4TPLLQ8fXvR1iJHowKy4RvGpvPUDKkto8Rz
         E7j6BarJRSHq8NX2uWre4mOFUBa7tt4QDPN/caMIDvvL+1RAUfj8VNXmQqHTwkvRq3sA
         Fb6aWCtXVTihoJp2ef+lcbl32t0Tp7QgYtWvBmA/l3n82tJRkIBIZpDqD3u/4nDtVN63
         6TAA==
X-Forwarded-Encrypted: i=1; AJvYcCXF2DKI9LAxDgDwg9MjuYJdsmdxdwaFlKunF4GXoiewnLwkQv6f7IKSpkcYGSnhN9ODePECcrA8K6BGXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Y+S9BIxdKtNtwJwYROaJHg+CywsBnRmw6chlJ68gwTjTIvSu
	5YyDYfgNtNU/vD7m/CRDm7tYy+XuOALksv8SFnXFz2RMAHkMUfsPaGjNTNZ/rf/ZMD+XZIXwhAb
	oustf00oBzx1dL8nP9Gdnv/zEfe47RGTY+Cs/bC5jlgGhmRql6FH+epNYD96R7u5zJQ==
X-Gm-Gg: ATEYQzw81ghm4lcSKQKPfLbaOkfgk3/FcKvVH7YWmS0Xoylb7ndDbhd3O/x/pL+2KcP
	kjbevNJnL5XIoVFLleFvxoroQiyEdXPNem3Vlz53SyC7wcEzy/zEZGrGGORfelcUoyDTR+F8S2W
	FMjLkXzZuiZUq8xnwFoa2iahutFDpcrY5Bxrh4Ql3CPFzztIJKHk6IOShUpPdwkdhfHmd3S8r9v
	GaOfwUavbJDDGwxSuG275XhnfdBUKe/CYwAVKYzzOzHoE+Mq/IfoOCcsl+waLZB9CZov6pbdHyz
	pmnyt5T4KC7UbwoCpnd1WcIzjRZioyBPuB4GzHecFw7hKVpF32kVOF7nRgFdJLcsUzglSkYc81J
	SyJ0VUF5DjEF/5iZ1sKSwUKW5Zej0H+Lp6lxJai5CI4gaCqjB6oxvazRvUmVxeWj2o6hhXx2tET
	vgLVw=
X-Received: by 2002:a05:622a:5915:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50b8cccaab4mr45595051cf.6.1774518067683;
        Thu, 26 Mar 2026 02:41:07 -0700 (PDT)
X-Received: by 2002:a05:622a:5915:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50b8cccaab4mr45594771cf.6.1774518067265;
        Thu, 26 Mar 2026 02:41:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ee83csm94343366b.43.2026.03.26.02.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:41:06 -0700 (PDT)
Message-ID: <593b3801-a83c-4132-970f-5075ebca2bc4@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:41:03 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c4ff34 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=J0hDaVVMoxkQcXr8FO4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: TCOWwf38eLtXvc_zKp88qSPrlIGGwSvG
X-Proofpoint-GUID: TCOWwf38eLtXvc_zKp88qSPrlIGGwSvG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OSBTYWx0ZWRfX2IuFU130fS83
 S9JOccxyyeZZRM1Ni5vHTJekh+4afyDiwS80JdyIJhFIshLod2LMXqYGBI/7+f8JqlxlCGMvmr3
 MOQztB0durHNDvxicn1dO7ZxOoIqZhTRJSI8cwi56HGcONFa9TLHC6MQf2nPC2Z13VUMEQ/PddW
 g35kwDsXUaaybY3JJO8NVC7BNc04FPoReDAcxGYTKLUpyJSemosaCBx3UDbeRcGQD4VHNS/h06Q
 u8F9eXqsHtkPJjw5dh7QxpYOZU7vqmxo1AzMV8tL3vs38hskKSDSlyqj+2DfsECxXnTn0h2CJfh
 LasXlwmW1eURItriRgAsbC4TRnn3bVMigjRxCFi/Ur4HTrz6YNCXNk9VZoXSdZURX1bVsDhm3qW
 nJYXfZEmy2f6jIwDsUO4hw63oIcecbU+ny7DQ7f6LNqEsrDwOKDc+k7B4taE0hJHiKdNHqCo0+a
 WWkZgac1cRT8FWl6RrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260069

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> Plug in USB-C related bits and pieces to enable USB role switching.
> Also, remove dr_mode to enable OTG capability.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

I'm not sure what this is going to do for other 6125 devices
that don't have the Type-C infra wired up.. Does just applying
this commit alone keep peripheral mode working on your phone?

Konrad
