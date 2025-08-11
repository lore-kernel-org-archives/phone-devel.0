Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA4F2D29CD
	for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911668; cv=none; b=bImD+Bq7MT9UjJaunOr8T0LxEur48v9vannbBZPcwFLZdIeEyBe2/Y5RfxxcpgwFwvGGE47E9RSb8EtzuP5x8D4ee5z0jpbTN7m2g33GSHG2zxKtg0cv6E5eHi5SbgX2mhCQlSJHB29zLjpwlLvTq0MFp/mufxjEbiMMk6BYaz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911668; c=relaxed/simple;
	bh=U+J+XLR+6ekPSZrj8pxsuPqEj3REqQNGk7AxDkssPmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nT2CodB/G24HkWmXfM6NOIEzr8HiNKeFcUiajVExjhQZ0CzYFP/R8lYicKUsHz+PjP40AIyonX5jKYzDnVS8Ybqc/3RPl1z5bqSTzx0AvfX7jnVGFP71D/bNG7egYdvKntyBbq8IkmY7AHpR4g4sMjVqhOCgXAvfb7dsUl9h0LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBJYPqC3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBJYPqC3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dK7V018311
	for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 11:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5fyLS4N2oFmF2UHiHGCjHJxCE38PIq/B8p4f+c32zQI=; b=WBJYPqC37sqXjgTJ
	zJ2c/zO11jThleKKz5jYA4agRwC/ZU0Tgghvp7SHMuvN7Efc7lulsqxe3VtarRrJ
	PjBdm3FfZ60ydGoEs647Qa/pFM76G8mebyFEvZYOfOijWb1JrUfQGqPiHw8KjenH
	/cARw3yK+w5B6PGtHf0d+7RRh0KWLqJl1eMRZvO3p+on49umkL3jPlZLbfVk56UA
	JmCzkTWcS0BiM2LgpWxDXBRzie1j2ulGdqXb3sEp6/leZNX6+ZnZ0XN3ojFCLTMk
	kqJDrcl/XNQPL4HBL+yz6mZJDLilsixIQdbmK1RITcUWlKBRcJpVo+unXVUMyMs+
	JtBFVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g45gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 11:27:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b0938f0dabso11615981cf.1
        for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 04:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911663; x=1755516463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fyLS4N2oFmF2UHiHGCjHJxCE38PIq/B8p4f+c32zQI=;
        b=K10qQoWKlmxRPOF8gt9zTk6L6HGImhqp33TJqY0kVUozsG0/xWd0KdmhTuBVJzSB2I
         zLl3+ASEFlFsPvqv1SEx2fhIXa4BhxuOwk6CASQ32TgWYShG6QO0M7ZxxsCCkYO/d6mq
         UxZbS+0YPLb5DPIcaNBxfxh6nS9S//q6pvpZa7MM3P5RuaR22EQ0wGKocHxNK8jc6uM5
         //UQXmss6F0+G43hGh12jYOTvmgdGPacQY95q7YRyZntp+WOsjMqVD5EMO2VaAT8Aogc
         GKANml1yay79+vPOhngiYk7080HToVG5wo7SFf4AQyZVMn/yR4Q6nEmW1YutESCDDQpN
         FRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU17qMUJ9fQvueiAvzmgS4GuCjWYLBT9SKR31yFhpII8OfAtKBYN1dakUW4Eb7I7cexNDtVa+EPvS467Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr7KNAff4YVzsWh2qSs+5YeWgOUB2PV4FRqoMbK4yFhEC5yaEr
	YSXR2HYyQvU8Jrgen0TthsQjcciKB/1XxK/lEDFDHq3sk7/K6WMrXp7iLksLARUy9Cck00UwFfd
	Byz+ThrTfyi/KEM1Ixhm1O0sbpzXpAqpEGhTCM8hZjF2W3BpNSwKpXlMz3DO3/ZJBVw==
X-Gm-Gg: ASbGncvZP7Sym+utNo11BxPW9eX03k67ELPBMRLoR727cHU1fOSQLXkciqRoZB8XMg3
	CjWoeq9nh6rf5ocmt20izMSJlkmkCHknT1ZrhNQ8Z3tvpV+u4QBZGWKHo2M1v+3iZZbgxCs6/jb
	4c6qE5KOr5Tnkk0opK6hWko9AH0eF8Q2V3zFt9TBU9ImvYuga9f+4QD2ROh1QbHpV7s7YRus3DZ
	FH96K+8BVbB+MSX7eZW2MgcVsSvqL1bsa6bMCPTwFpVoceWeRt+7pg9r3NuEbgXMZFNhjvn2wzp
	D42fFCv3TISK0UgKmbIf4TDjBa7EnUxl28yr0YvfHRP8Xm/fOETmSXoN7v1/qepbhvPv0r5BCfu
	hZ8F1zeDX0n5BWcsg4Q==
X-Received: by 2002:a05:622a:44e:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b0c18ff1b3mr53726831cf.2.1754911663311;
        Mon, 11 Aug 2025 04:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJgFSDOS5fEjCuyG5NolkHlckR1ubFRcXPAOC/JGl654XR7C52OV8G/dlGBHR8wLM6zvgBnw==
X-Received: by 2002:a05:622a:44e:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b0c18ff1b3mr53726531cf.2.1754911662717;
        Mon, 11 Aug 2025 04:27:42 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af93d62bc97sm1729893366b.80.2025.08.11.04.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:27:42 -0700 (PDT)
Message-ID: <bc5c66f5-2f75-4371-bfc0-452d69bc16e9@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:27:39 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sdm632-fairphone-fp3: Enable CCI
 and add EEPROM
To: Luca Weiss <luca@lucaweiss.eu>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-7-e83f104cabfc@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-msm8953-cci-v1-7-e83f104cabfc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=6899d3b0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=RAyH1-HTb1k6rVK9-NMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX18FR3RSYI5E+
 c06GRn4ixQw7SH/cgQF2GJ+x+EuNaDfrzJd83KihICXveXlwbngfdJGG5QnyGVuyZiA5R9KP3tJ
 5K2uThkiJ/DjuCsbxeWlL8CjLykH5sUUJuF8B78WpuoxxYlGJY8LBQwOc2Z8olFZ0bBhLAu1BEp
 8mhovY17hftI69qXjosxmgq4C8tfju4wAlY5RYQOSeyX63Ov7Sg4/q7EwfI52bf6mOcSsd2zyva
 A+DBERNFsknqP9ibOV9sokO4H79ziNEqGup4uhh01Yir/mRrcn3J/0DLvoyszNvL03GifJownOE
 5PSiiUGfkoH0qwCZwEV+czimwq7UAScIe/TxmALPJ0dgrlLfEL8H3oqR987ytUf5NKuYW5Bi/yD
 ZhIoAFjS
X-Proofpoint-GUID: wEGKIBMG-XuIBcSfFrR9IpmiM5YNwteK
X-Proofpoint-ORIG-GUID: wEGKIBMG-XuIBcSfFrR9IpmiM5YNwteK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

On 8/10/25 5:37 PM, Luca Weiss wrote:
> Enable the CCI where the camera modules are connected to, and add a node
> for the EEPROM found next to the IMX363 rear camera.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
