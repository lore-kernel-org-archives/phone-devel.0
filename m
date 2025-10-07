Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8825F2E11C8
	for <phone-devel@vger.kernel.org>; Tue,  7 Oct 2025 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845233; cv=none; b=hNsFHHIMTpeTPoNu157uWqebeIQyHsSJzfS/KNQ+YkYk3Q6lt+QoQ0kAdYYz97f/mgR3TIXjbISUlurEQY3z44UpINogIcC/w6azvQmUdsB4qQF8kq91wVXKW+4NGgj9PaehVHdRKg7DaboER/y1O3VrPJO3tUmc+oU4UZQxQus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845233; c=relaxed/simple;
	bh=cdt+xIUTUY+JbHEpPzEj8o59T1ECMCeqF+g9xZCYiJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jefcwTgMK7mYCvQVqNES3uAioSNX+VvpaxXuQ66gM/DfAlMMq5bUlF+6mmiXYeh/9RTwisliSLvGmYqeC4+zy3/5rHgeSEs5p0jkU8fnxH1rPB0WhdprrjcqTo6JaVGl9BQAo/p5KT7cYXVriVPGQTEipNHGLWk7j472aMlrA1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJJLtJ4S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJJLtJ4S"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5977hiLI020044
	for <phone-devel@vger.kernel.org>; Tue, 7 Oct 2025 13:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fiNc/ZDld9lHBOfROmDO6f0b35mQryE6GaNus4HaVTU=; b=ZJJLtJ4Sa6IzdQP5
	iOCwOhtwN/oa6v65lFuwMLp6viOO2qJQCR1u9n4wsFGej5IO66wSfYpLEIvDU3x9
	sfEFpIzL9WlAgKKFx1p/YNpZjGplIHMmklsCIFa/A/gnxoPMNGdolZoG+bn6sf8W
	ukOH0mGEWNe+WD5K9qtQJU6Vm7XtP54CJjd5lgLGD4k9irY6rYGS89bTNwWrBr9D
	r70G1YpWIXf5Jh1l9DGm8owSPNqz7SM1hDANDMADWp7Bx5az9+uSRZWltKpFL1sl
	QXxNoLSNEVfIqQJ29d1tfkVaPm9Rp0wabvOXfA3uAJsJYOmKnzsSSV17uLmiQFZy
	Z8shlA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpt7p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 13:53:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d880ce17bbso6495051cf.0
        for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 06:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845230; x=1760450030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiNc/ZDld9lHBOfROmDO6f0b35mQryE6GaNus4HaVTU=;
        b=QGJAh82safFiiSXczQeOEE2nohQOZyoBRNppjnzEppM73eMuBkvopxUCaFHWYkmT2s
         v9Zx6L+kyQznTfIzfUP1DxjG6yYjcw+2yJxWw43XmbYGw3M8ZdU8XRc1UYLrjbTEh3Ks
         wX2pPD1tADFv6dRNJIaNZtKMJpl/YCTvQaK0I/fSs9/iGW9vGnDgOy5cON5SCAu+I3x8
         H8DrTP+nuOtp6s33nzHAR56gvSMh0UTXZxSxM9Z9qywmPMj6tKFY6ZBWNwqBNwzf6IEr
         JCWPE2jwO53BY3SShu2FSB8fAVclIIKEKQuhsXoCx2YAKSIpfIEi4sxFdxSbO+uu/Fyn
         c/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRapavs/O1VZKHgGPif9AEFHTSwiwGYXCgfr3uyR/NU7PoARO9c80gcChtdholpBahN7R1Sx1OaTTXEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIw9kz/iXXXTFvTR0yGAl/mh0gmIvQ+CZs2M1s7BRD85YrReKw
	dvqRtyrI9pvJwq6f/9Z+2oHVGUCN3jQJckRrdgt5PEvOKEaeL1smapxAT/1f7yJ/eF24AOVPeZ9
	SGROtTXwymFnl1anylLonX5SkQiPFnR1+xIvT6OZxia5iWROtECz4FAYgV29B9jZCvA==
X-Gm-Gg: ASbGncu5cNTl1WDqWjtabIuHWUEuccWaXp9/lV4/uOJDacepKDzBm7y85U11c+iPWw9
	hETRj24A2UkzgErwRZ4paCsbBeW+FAFJNK3Byqs9hHQUDLO3X3xZbs8GBFlRWgSqkkrt3vhfHNx
	6s3WJDKeo3RWzwzBHg4Cm31/RKoe5i1MRF61qf6gJH+ORHjomgFXwNtP1ztQGwvgqlyobHuemca
	gBnjxE5FmwLqxAcySgsCqy97IFJrF5GRE6fzl3/EwqCIajpIwAI7xt/Bv62QzMC4JP++ljDmb+5
	Y0Ycpx2WFmnGgFCGDIViUA56gGNnGABeN5yOyc1msCgVMrpVxNjYFV26/uJbHDvInjshwWMhP2N
	cSuDAIMGzS3c8WUdFgq81PyKsl1A=
X-Received: by 2002:ac8:7f87:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e576ac46b6mr127531691cf.11.1759845230222;
        Tue, 07 Oct 2025 06:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZXrDJuWwO6h54DXmE2fdQYzL8QfITc/WlKY36C1qhe93i2ttKGEhMEDPLcHC8FVYGtfGAqA==
X-Received: by 2002:ac8:7f87:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e576ac46b6mr127531481cf.11.1759845229682;
        Tue, 07 Oct 2025 06:53:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9f50sm1393040366b.9.2025.10.07.06.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:53:49 -0700 (PDT)
Message-ID: <fd8bf93e-f6e5-45a3-8e7c-7e63a918809a@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:53:46 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-5-5e16e60263af@postmarketos.org>
 <6145be40-3b2b-4554-9d5e-c1f9fab0363b@oss.qualcomm.com>
 <da2f17a144374f326de9e0c5bec638829a31cd1e@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <da2f17a144374f326de9e0c5bec638829a31cd1e@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FN4GNyY1kgY9UPyW-37jsDNVFAhz8fVx
X-Proofpoint-ORIG-GUID: FN4GNyY1kgY9UPyW-37jsDNVFAhz8fVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX1jp2OHedr+pT
 fmt4rgqZAlRscNM9fz1vrST4ALXup31bCAyLtZX++dVBhoikL8K9FLd79eKt6xIKHiowI62DsA7
 flJ05diOPsUxiqWw/VRpaeOyBxksRTUBzwO+9rP11vQFB0cplbPo+EwPXg3/nOnN6OXftnqPwk0
 Tm7dJjS8QPJnSLJgs7cKGiZVBPEPx4x/TTKJYI+zK5lbGKQPi21i2FddhVCUjcLmOaUx8xQrLtu
 IkkUppKx6URlouyuHOcc0c53DX5SVn7F6YWUu9O5ja0uD/XtwTZrffJLM2r32u/sCbhfRVvV7nh
 7ku3Jk2bIUtO1OdB8sVwMhq7zQkh8JjocHEJ2wj/o+8ggRUMWRlKTa5K0edoOZsHHYvmj//at8U
 Eg0WsLjtMm3pJiDu1/Ia5WJ8TEqvOw==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e51b6f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=XKEg-W0rSRFBAHshmuIA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On 9/18/25 3:38 AM, Paul Sajna wrote:
> September 17, 2025 at 1:50 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote
> 
> 
>>
>> The vendor kernel (for Sony phones at least) does pull-down on both
>> active and sleep, making them the same
>>
>> Konrad
>>
>>>
>>> + };
>>>  +
>>>  + sde_te_sleep: sde-te-sleep-state {
>>>  + pins = "gpio10";
>>>  + function = "mdp_vsync";
>>>  + drive-strength = <2>;
>>>  + bias-pull-down;
>>>  + };
>>>  };
>>>  
>>>  &uart6 {
>>>
>>
> 
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judy_common/sdm845-judy_common-pinctrl.dtsi#L109-L148

Take a look at these lines instead

https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judy_common/sdm845-judy_common-pinctrl.dtsi#L137-L161

Konrad
