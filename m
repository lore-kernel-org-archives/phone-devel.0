Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE185184540
	for <phone-devel@vger.kernel.org>; Mon,  8 Dec 2025 05:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765172926; cv=none; b=Q2hN0IqYQgLCthJKjv7fm797ljTyZmTivO0vDI1XoBDKMwgVWk4VEFkYwmu11quDXGq0B2QZrniTiuqxwAeB//0MURU0g6O8Aj8tYTPWEwHO/vwp9hx5GKuACqzdWnTd3dxTrnHqoX89+8sTXtrtuSfk9w5cTT8d/vq07Y+cbFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765172926; c=relaxed/simple;
	bh=P2VoLVsoP+lFbU8Fwk2vLaVKWkB4aVqFanWP2t3uBbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5Vep3+bBfNbvJHqgBG7x6V5/Rh3GB5U9qwA4Q+KQwE/eeeSZwvuv25uWKcKmG8fOTalK58mCwiI3tR6GFTP9eTsP4BLKpxopq6dIU+Bzs8yDqZ8F7/FG0YYUFVNujPb7m+owr0DBa/n69F9pxTN35M4Vj1SQYONJHBk1HeHC6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2ZjtBBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixogGnpc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2ZjtBBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixogGnpc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7GhKKS2754737
	for <phone-devel@vger.kernel.org>; Mon, 8 Dec 2025 05:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tyEN6oFgw16Xz4lJHse4pR1jY91ekbIZ4shjSNASNI=; b=S2ZjtBBC3fFo25Yv
	WoeN9jydZjrmHDeSsL2SQ9KYnhV7vavOZDbr2MXGG/GRMGUfbe4xnsbsj8YsBevm
	0mj0YZ7PeQxZuI4Pw79g/F69bBvK8ajZ9p/+TBhW24R/Yr284uaMvWfyGpR6JSDZ
	N5NN6ihcjRq+yq5q50PGtMQbKJoCCQJcp8dr4DcLK7+uLRFBrxGEM4iMmkfRSJBv
	c6pIXwy6if49MAnAFW8zUG0wV7PS7ut5wtlZqynNIeAfMxp0kZtD6hduiztaoTt7
	sVWkTZpXB/actpitNp6nB367Q6acfU70sOwRpp/MQPnimnI4otYjY+CnhHlFe7UQ
	EfHtrA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcjvbqk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 08 Dec 2025 05:48:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29845b18d1aso76130815ad.1
        for <phone-devel@vger.kernel.org>; Sun, 07 Dec 2025 21:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765172922; x=1765777722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tyEN6oFgw16Xz4lJHse4pR1jY91ekbIZ4shjSNASNI=;
        b=ixogGnpcwlBvzsiTTgj/Y88WhesuqSI1L3bEjZm0q5/VhERJidfzDY6cuAgG8/unh/
         6A3Y6zKnSkJHyWP9Y51bVwBbY2eHiUG554gq9VEQGFres8vbf8yDswWHM7Fc0PZkKQZO
         yIot0RPeiWj8dXbXYPv3uglTuqpnv3hz9WLDJfJ8KvXe9q7fhcPDTtJTRi71tAYZyAsl
         snN1+gjxDazRBKTHTUZr8OAApDsFCknouQ/iR0hrAJ+kBUx0rOFcaZFA6EKPUtTKlvu0
         3YFFoLGawMbCRp+TltmOg4TuQ/bfTB9k+oLF+GWGloUFu+mtdPMZvjvY0PjFgy+tFX3h
         oSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765172922; x=1765777722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tyEN6oFgw16Xz4lJHse4pR1jY91ekbIZ4shjSNASNI=;
        b=Jd+PqnlwxiJqU8Yie+SV+1JfWz+yFj2cKJNEpewz1fOKn+HS3ljwPY+f+kUrYcJ0XT
         6XiCRglM+HTsJu0LosKSAbno3Epu4RslEkk2f6SS/+qA2kJSmxncvREDh81pv4AlMVNr
         RtdUphtmzIminWZasx568ZzLDhp49+j00AWu0c4Toto12BiVNFxfspCdGgdSrtIKlpAS
         WzC5RoDfpgdq761SlLSRdLgckGH95/e0ZAM8ivzbQa2xuf6V0oK15y59YWTRVbtOKOoM
         agI8woKozQYgxD8t3E3udud8FaDa37P/Q8QR1L77EhYZmbkl1SF3sPg1YQZhdhMrZXaz
         duXA==
X-Forwarded-Encrypted: i=1; AJvYcCXLAfrPqtDhvT9lo6MqJmB+Fdb3/pfk4KeLWEu58skmzU231gnP0oOe9d4XpxhEqDaMfjcIMgt6uZRUQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt2CPmv97BFkmbRx+p+j63YejeLKD/USAr7Cfb7P7Ifkk78EFE
	C0Yw19i1VshPZL1K0ZCskRgCNwAntQGKFi0Dp+6ab09TQvN1G4k8nTr0yqY4IZ8SnmSVDv3aFQN
	+GsNM8OkQGklJEgw7VghOY86eKoW+QEep9BxhBGQHVkg3YH3oCENHx48plX6NWT4/jA==
X-Gm-Gg: ASbGncswUlp87vD2f9MbqrO5maHiJfbsyB5boJgi60XbPMLaNzel50FS9AUYxs5vpZI
	UOr1KIzryzOb9hCuTymccuOoaqU5+DlHF5cF4lDjz+RLFEClO/QxDrH53s+iUyheMk6pkpjk8PB
	KGmP7tvNEUP118RVZjCZ6ez97GjrOChGY/pZlg/sdWPBYfnmArFBcq56WXHc2ZsJSVccd3zIipV
	e6W0c8jcCZXE2wGE1ONqSGSL/LE4Pt1b5beJ03S1X/Akgh528CCA+d13GYLlmQ3Vbm0YoOQvrxU
	d98h3FuvdbIAlqlskb+zzwrdhbTMtuUHnjBTlAkyTxTfPDbSeDZfKx1HJNd+jFXfqK0i8Vmq/1z
	bSPE5Cvm6bBgBMbjP6oZkfNcNxmAEz3YqROxqqpBnlDCGtACvJGJaKdRriLFjzrIqkL0gIOH9ls
	aRVRr0
X-Received: by 2002:a17:903:b0e:b0:299:dea1:e795 with SMTP id d9443c01a7336-29df5deb1e1mr49290945ad.44.1765172922596;
        Sun, 07 Dec 2025 21:48:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvpM8y8WsbAjIWAo29vlyowfOsf/6+lie2maWDWdJheAZoF7Arfz9a0tz13FHi/eBSLuKomw==
X-Received: by 2002:a17:903:b0e:b0:299:dea1:e795 with SMTP id d9443c01a7336-29df5deb1e1mr49290745ad.44.1765172922097;
        Sun, 07 Dec 2025 21:48:42 -0800 (PST)
Received: from [10.133.33.182] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49c96bsm111202115ad.8.2025.12.07.21.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 21:48:41 -0800 (PST)
Message-ID: <0922ee2f-e744-487d-adf2-04b6ced0a71e@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 13:48:34 +0800
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Introduce Kaanapali SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
References: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
 <20251204-knp-dts-v2-3-596d8398c6d3@oss.qualcomm.com>
 <mi52ztn46bjbvcebq7fddntedjvbtvuhjnuin4mq3h45mxihdv@r6opshdsmlbs>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <mi52ztn46bjbvcebq7fddntedjvbtvuhjnuin4mq3h45mxihdv@r6opshdsmlbs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Dccaa/tW c=1 sm=1 tr=0 ts=693666bb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mxvvBYq0fgLw_0ZU4r4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA0NyBTYWx0ZWRfX/PMQwvm/eoOP
 qVzIPJOhNiRgJ210mfPDUShmUkCx0JPQPz0VmNzhQxX0a6PGcuvBUt+xXQZvEngS3JONHMcOJpj
 VGaEV28XpAInma4oF3iq6EPVBHgyLRnW+Vn2vQvx823nk2H+w4zQwVvdyWderiYJdZsQLHfbqEc
 Tjz/q7Z3rnNeVAZ/72q1mpKXBNR23IfraNNJiguXQEMYDZHE4O4dn2VHsgUH/HMZvqlUMywZL26
 RiiSPWdMByoeFqNZ+3/jf1uYD04S+zGXTK/amEoyQXhufz8HdkhTqyUeEX1mmovZaLn5fsv6MNn
 aeSwmslY0oVA6V6ttamS/QHyVAfa+QXAOROfr0yMFqBsXPtqI6zR1cCev9beI4jj9IgRZ8YcF9S
 dTh+HsuhPyvkvTnnoJp2IuiTnpZU1g==
X-Proofpoint-ORIG-GUID: L72MAep7WbXpv0870JvAh5tUhiFEDG0F
X-Proofpoint-GUID: L72MAep7WbXpv0870JvAh5tUhiFEDG0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080047



On 12/6/2025 10:40 AM, Dmitry Baryshkov wrote:
> On Thu, Dec 04, 2025 at 10:31:21PM -0800, Jingyi Wang wrote:
>> Kaanapali is Snapdragon SoC from Qualcomm.
>>
>> Features added in this patch:
>> - CPUs with PSCI idle states and cpufreq
>> - Interrupt-controller with PDC wakeup support
>> - Timers, TCSR Clock Controllers
>> - Reserved Shared memory
>> - GCC and RPMHCC
>> - TLMM
>> - Interconnect with CPU BWMONs
>> - QuP with UART
>> - SMMU
>> - RPMhPD
>> - UFS with Inline Crypto Engine
>> - LLCC
>> - Watchdog
>> - SD Card
>> - PCIe
>>
>> Written with help from Raviteja Laggyshetty (added interconnect nodes),
>> Taniya Das (added Clock Controllers and cpufreq), Jishnu Prakash
>> (added RPMhPD), Nitin Rawat (added UFS), Gaurav Kashyap (added ICE),
>> Manish Pandey (added SD Card) and Qiang Yu (added PCIe).
>>
>> Co-developed-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
>> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1606 +++++++++++++++++++++++++++++++
>>  1 file changed, 1606 insertions(+)
> 
>> +
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		pdp_mem: pdp_region@81300000 {
> 
> No underscores in node names
> 
>> +			reg = <0x0 0x81300000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
>> +		aop_cmd_db_mem: aop-cmd-db@81c60000 {
>> +			compatible = "qcom,cmd-db";
>> +			reg = <0x0 0x81c60000 0x0 0x20000>;
>> +			no-map;
>> +		};
>> +
>> +		smem_mem: smem@81d00000 {
>> +			compatible = "qcom,smem";
>> +			reg = <0x0 0x81d00000 0x0 0x200000>;
>> +			hwlocks = <&tcsr_mutex 3>;
>> +			no-map;
>> +		};
>> +
>> +		pdp_ns_shared_mem: pdp_ns_shared_region@81f00000 {
> 
> And here
> 

Will fix

Thanks,
Jingyi

>> +			reg = <0x0 0x81f00000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
> 

