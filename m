Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C433E1D0B
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038654; cv=none; b=HWso6w9mjNdX7T2kWFCzqqDl0P/oIJZp0HGulLh16+Pa49SWcgRNIn5eHIO4UYaHrjdTrwm6joeI5rAnVUwxU1oWK8IlcnIbHpCU85cco0tw/Rq6ABo8opJVRFqI7fcWjZ5GasanJSVBqHomEdgkTHJ6WiVPQmBqkRhoSeuYnpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038654; c=relaxed/simple;
	bh=DEYocxncDAcATk2w+s2H2eB3AWq4kyjXnOqtkGx12Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qY7oTG3AOJ1mf+eERs0Dpyau3mnDOjXkN0Ss9CoWk63CWjbb+FzAkFj2kH/L1ENAPBNMkULLmzXw0fmFlMNzjMQfK+NnXYaMSU6i+8dDDRk7dnRi6D1jxW+eehgwfBVMWwP93SjgutBRmX2EyHMAvqOt4AJadqt+rT79Jx96h9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWOBsNYw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2fK4gxI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWOBsNYw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2fK4gxI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314OUMD1563304
	for <phone-devel@vger.kernel.org>; Wed, 1 Apr 2026 10:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZrEHXpdsAUJdgyqXUpeWecTZRtz5/SYnsoDlrdt2yg=; b=OWOBsNYwyqFutoD3
	Z9ArQxqvuc13m5ebGZFvxBQm6Un4zNBzE2JpD1RY/6S+EIviMQUcJU1r6deUkjkh
	kLBZs8VyIQ5QIEs/fLWfSrs4s7HJRFHmtrczmCN8l5gMMLIDW9JdHbxuCgTLwJcA
	VVP9ReZyKLf2RW9unAIY1Ci1byA/vFJKZJdehD33tSJd53zgagMVBuTuDPJ9z5y+
	UM1JFTOSVtD+FrMkzBDk1CZh+kRHOMup+Lm/7qrzjTEJrncItJ2oTbndAl/lRBuf
	K9y6ZNnhDTht/b3egW57zm0vmRESwWxbvTWSjRMxtxhuiI/nk/A2b+Auinyagds5
	3LRB8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3sb63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Apr 2026 10:17:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfbd336c3eso255139185a.2
        for <phone-devel@vger.kernel.org>; Wed, 01 Apr 2026 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775038649; x=1775643449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ZrEHXpdsAUJdgyqXUpeWecTZRtz5/SYnsoDlrdt2yg=;
        b=I2fK4gxIdoC6VT13WDpD/DpInjOjJ+1v0L1kKKW6S1uTL9m0Z7cWCHjAZz3suT1De2
         gdIVp7Wvs+d1jDOk4vXi8RE1zbmIs6opsojp35YC4Ps78M3BrJTFs9OsDHi4DV4JQNmB
         GU8aBtwycr0L0crWZPZlYc4ADN2ta+50rBupUl8A7vcZdRIrWjFsuQBI426fXKDmBOzB
         a3hSUXVm1X3x212hh1YyhCriKaKyfEQPpg+bDsRwNne3kyV1uONDTivGdrScDNCsKKLk
         wFLRKR5ou9g+Wdc5FdBaC5/2f15hncdkG1HW3wyVpGdB0IkGjjCI1E7vNWKzfETv3xbz
         /RRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038649; x=1775643449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZrEHXpdsAUJdgyqXUpeWecTZRtz5/SYnsoDlrdt2yg=;
        b=NoiFFHMRrPivKRLUe0AN9J4A+GJesZ1iVpp54jdOiqYkFwwxmjRRNsSNlrgLhngtYd
         GEzlQEcUuMHoZPmD3KNRLCfXzF1VZ0cAh99QmOEyJ+z3ZDucCStzzw1UArIVdJQQDTt/
         StfSDQiY1mIYxb1fh9vtl33r2OiB9Bndo5I4ZA++j8zx23dKhJGcdnaUgy3cE7EKGVRn
         +sf9FrFUga92cc9RUgjS9Ap3V1113LUCA4EWYtd5ewULIzOX/gonnzoURYk0NWZQeqNk
         7EE/N1RpwdqulBngwT3t8pLh87PTo9EdHB5J3ijBj2q6iZ8V5hxgx5BdS/xHQJ+XV1ds
         PwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQic6AnNKFC71G+S7NM41GWTs11Lx8gAA/Wq3f1p8W5239I6WXc5M6//Pn2crQpV5AbIluK7DfuPYjlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLE9X+0vpxQWR/b0a8Gl7xw4vkUq13PPYIZkR1nfb9S/IOlAib
	Hwn9TNW+aiiScd0cFFDU6b3uv6D5CxTKsl7j6xBRZSFG3DunxvVn7STn16DB58U41E3oY9nrMjt
	zi4ZA8gvMqeRroC7QV0+4uNrcmJ5CulWWguWMpc1So0f4Yj5Yu7x6WED9pJuJB0n7kQ==
X-Gm-Gg: ATEYQzxVMT4qejt4D5bxMXMMKXVjQOOATz+pHucGS6fH/mX0AWG7FDVxebiWWzWZgDv
	giALsOj8rK7f+IIK/pMjBY1cTgwnoVlmFpE5dRpe/HwEDA+QGpULMafhqtuVpn7bVR32Li44zyS
	WWobocjUzDSjMYOhxb13AXM8qhS02phbCjKGIiRQnLTgNVCaThwrh/wREf8NKw40cZ4x6FIPUG5
	iTmUBkzlwEwjoj8XFyZfe1ySDN0pIDaE9JHzFO48NT7TYjyCacv/M1HvXd7He8pamak1a4c+uXd
	AlxHc0VVCDJbpBXz3v0Opfky1t3ygDjZiriOHjnkZpI8E+mcyzYzTuweEEZAfJTcSz24olEkrud
	kAb8/TMkp+ViuSkGq7sPeOmWezgKHKOqP9Dl2GLxdKWZnuMlNrH2YowWQvQFJpU0C+msJlAq8yt
	2O4zY=
X-Received: by 2002:a05:620a:44c4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8d1b5b8cf33mr323796185a.3.1775038649594;
        Wed, 01 Apr 2026 03:17:29 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8d1b5b8cf33mr323793685a.3.1775038649096;
        Wed, 01 Apr 2026 03:17:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c5b0f5c6dsm1303774a12.15.2026.04.01.03.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:17:28 -0700 (PDT)
Message-ID: <18ea1ce8-8d55-4fd9-bf13-28f59c1f43e8@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:17:24 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}:
 Reference memory region in fb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
 <20260331-judyln-dts-v7-15-fbbc4b7cc557@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-judyln-dts-v7-15-fbbc4b7cc557@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: u4ZveiSGEb2ulVMlU0Mk5o1qhGei10d3
X-Proofpoint-ORIG-GUID: u4ZveiSGEb2ulVMlU0Mk5o1qhGei10d3
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69ccf0ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Gbw9aFdXAAAA:8 a=fzFPyQH34aG_WpUDus4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MyBTYWx0ZWRfX8Fk9U0LEiSQR
 tFL22JAf0GotTMmKfLURoYxMXQyRrsRbiu2NS7sYbkMpqVSUetu+NEYe2+Pz44dCFZLcDGo/p8R
 eEkaIxYGaEN6ccegCJ/cilA6n207XKkCBCRwwZyYJLq5DRll4Et74c8CAGCTuPTsjqSiOiFHnF/
 bYm1jY/l8SNr9mzlWTIGr+N0cf2SkOYQ2cDCa5wh3aq8smu/8MLORSjkyooEkL8lW6F8fmP9PXw
 rwbIKMZLqAVRyBVyXSG7LcidTKLDhOmqIWOI1G132/ZD3K19/6i5p9jRNfJQwdQeg3f56EtQgOz
 2Pai6x7oehiXNmWW/Ntq7nR4E2BWg8tBQonYx6C87EJ9nFi3tX3T4z/3UOg/WnwK8w44KU0YFFi
 pVAu+25Olf6U39MgxyVMa4rdEYqHv07q17oeyyswnUzd0l7xTuTHhwaj4z0vqpPbx4zAaAMG396
 v/d9mIAJIcSTjRFiiYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010093

On 4/1/26 5:23 AM, Paul Sajna wrote:
> To prevent duplicating the framebuffer address and size point out the
> existing framebuffer memory region instead of specifying the address
> manually.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +--
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 85dc4468b6c4..86cf4eb44084 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -98,8 +98,7 @@ spss_mem: memory@99000000 {
>  			no-map;
>  		};
>  
> -		/* Framebuffer region */
> -		memory@9d400000 {
> +		framebuffer_mem: memory@9d400000 {
>  			reg = <0x0 0x9d400000 0x0 0x2400000>;
>  			no-map;
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index adf41aa0146a..83e392907244 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -16,7 +16,7 @@ / {
>  	chosen {
>  		framebuffer@9d400000 {
>  			compatible = "simple-framebuffer";
> -			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
> +			memory-region = <&framebuffer_mem>;

Because the node no longer has a 'reg' property, it must also be stripped
of its unit address

Konrad
