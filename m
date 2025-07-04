Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DE429D19
	for <phone-devel@vger.kernel.org>; Fri,  4 Jul 2025 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629875; cv=none; b=VxA5E39KSmre9BA/MZthZS8yc7RopuyHRRckuIeSBjwrPGB5EiBgkXMFj0strG6nU/8vYKiNXphE9eskSIRDjB0UvrWg41mm2XhTX0WI0mcn4CPhhPVxNbJ3LPHFNHXNshJWLsUf/8sfRSAYNl3NZSWTG97n9D9AZPvoguY9dBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629875; c=relaxed/simple;
	bh=5fikI+87o75mbLixisWkcdUIi9r+QELtxuF3rHOb/ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVSpVSfUzvguJbendntoU2YpCByx6RThiP1g+TL9ugZTXSOWajgRd31qDxRN4VYVA76jtbmDngv/qfIlcZ05yoqqNBNha3PLEZlAdABR16MGebOMiN5ckAI12jWgNnTtKlI6ONnd35UENN3aZAGpa3QOVq4z0xBj2Q9ofdXqpfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX5GUFg9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX5GUFg9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564BWUSL010373
	for <phone-devel@vger.kernel.org>; Fri, 4 Jul 2025 11:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2vo/P6bZVJ6DuTuBUMGx/1yOw2ZUrq+gW27lFrqtTA=; b=CX5GUFg9ojZ7zVI/
	u8kyfZ3pDEbufbdqhhRaPwZy1UQ17VmPigWj3Dhvh2t7FHOD1NcY7bdxxQPzFE5k
	NuIK77LHyIxafexQlk9CqpVuoMGGByD+Vh7/uFS9XL6JLEHS4pVrQaYL4T4awV2S
	W/Ml3Eolu8Bo2oaJY2Udl9ShJLZ3jRsEeHJG3DsWxtcPu2N8l2K6Tab+snZsV8Ra
	Nx1dZBjyC78bqQdufztShPP3n+0MJiX2l1/hVJDX2L5RTWwDdOusQyhzLm+srWIF
	AmrbKHkV9Z8BYakmfO67QYGg7IhWHnewE/R4CMEQ9w1Eam8mhh2P85G52EOHLfJW
	EnVn9w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30gwy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 04 Jul 2025 11:51:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fd5e07066eso1558946d6.0
        for <phone-devel@vger.kernel.org>; Fri, 04 Jul 2025 04:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751629870; x=1752234670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2vo/P6bZVJ6DuTuBUMGx/1yOw2ZUrq+gW27lFrqtTA=;
        b=sURxPQlyEimRFmoEcnrkdnQnO9Ifa8TYxuS6FpJ0W9yiLf5x5uJW5tDLVTK71Fjzlg
         BZPeF9Wv0Ql2rX3GI5IpzfYlGnaCjtwK61bME0LiIVZitb/+kN2Kz/tiG99oatrEQ4+P
         ufZHzS8awueJNBr0C3aNv4Yp8L2lQ1SBtUmOPrTTPETPvc+CYZTXbzkZw71Ou5GRtCxE
         SQgKwpGIwAIwnMSmQsOHzgtZDclr/0K0JQ1jtpaTsYsjHx2wqskKA77jsmInd24u/Pcr
         fiD9zGxunrceCiLXqZa3qmgzp2cy/A0+gsxZuJddpFG7sMKpyOMQxjukxRIdLAsoOkaa
         Ek1g==
X-Forwarded-Encrypted: i=1; AJvYcCVCmqaCZ3233En3NDjSrBfLGdUCA2AHE5gUin9eErJQ1MB2OGRVX93GVfc6lvBY1j5MiLiOnY1TwSyUwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVK7zWLh3YKQZ+UkvU6comJuhB+7mYmA4HCedYXEuAc3kWREut
	rqVqAbPy8QDrsiaeSJWYL2o0/ybasS+AgBT38/ozypb/ztfLeNxEQVHCpLmihO73yGReIVvyxvM
	YghiAH7FBg1tHnPxNyuF6Alem1PNGYc2+0YIkDFOG2+/3p1QZb9Z/xPGYo/KhoCYTuQ==
X-Gm-Gg: ASbGncuCLxeta+BnrxfQezMBZzmfx043luBmTKTkBtABRqNh5GxeGGprDRsLvcIWLN3
	uQ/wLg+bvIqWROiAYiB+QR6TRREneSJz/AFY18T/QfR9EZB97YT/76iW1VvHguPG3Dk13e/xePk
	P4GDhfeJtGrUV9jTOeyx0esjqTlKXpt1ltc/Canu6J9mTxTlD0bZVjihu6chVWw2q8DWNLCJuCR
	zhgHo/srh2ew9gvcHljGW3vZZ8W+K76noSlTQENTl6JlhNDcO/3eJHYqVj+RLbzinWserTNQbSf
	HkP6ByPVDAJDMPZdcJ+rThCeCy5KkTvQ9uuAt9x41iCiVHTC4UJ3YHE3aUOm9e4msOXycDT9D3h
	5si7SAA==
X-Received: by 2002:a05:622a:11c3:b0:4a9:8e6a:92c3 with SMTP id d75a77b69052e-4a9978746c2mr10688301cf.11.1751629870298;
        Fri, 04 Jul 2025 04:51:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWrN2NEryvPdcQsXVW0TeWgc3Ic5ZNhY0zdAQ1OKX4lqZG0xsfkEzP8WPFD5XVFAgSx6Nu+g==
X-Received: by 2002:a05:622a:11c3:b0:4a9:8e6a:92c3 with SMTP id d75a77b69052e-4a9978746c2mr10688001cf.11.1751629869683;
        Fri, 04 Jul 2025 04:51:09 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02c6dsm158640266b.127.2025.07.04.04.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:51:09 -0700 (PDT)
Message-ID: <76546615-e24b-4380-b1c4-8c381743d31c@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:51:07 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] clk: qcom: Add Global Clock controller (GCC)
 driver for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-3-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-3-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6867c02f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=fvyRFVoqYMEcb97R5LQA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: w593Izdg5--gOgm6vOCUewvjj82rQrk6
X-Proofpoint-GUID: w593Izdg5--gOgm6vOCUewvjj82rQrk6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX8FfmJaPg0++F
 cgoYF9mGe8yN7JHybWfk45io9QXCElE08R5fQUTTlrAJv2hWj+VPgcaFk68RLnpoz4tM7Bh1NTC
 P9RlZPtilRsaLXD3UbutOrz0D/2hxNEiWT/XYXmildFWvBk49lgxxGDZha6+BCjsQTvmh6j9FYQ
 24VYNfjDBSwicpKUeTToTuVPUJtsDkUBbz6/zZSeJYuVVeUJMqj2TjXysEVVAbUWZXMPna9Yfyy
 P3nlIxDIubVCTObd2nViEjWE6fi1Oc2cdGnEuPBuH3IQR8ETP/3xW9ucv2psW6fHA8DxdFmdAaE
 hNJIBJ5ZAZeFTadNHCASJA3ENoVpzQlqpSXf9x5/3nle8pgPi/EBO9YPGFO4G2ZB4gDIky2K3sx
 X2hew7cTjctRKhzGvCVz4siQ4T0bQnsZmw/yX69WyvY4ustC0QiDrD8VXjT38unZ9m+BvsJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=966 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040090



On 04-Jul-25 09:16, Luca Weiss wrote:
> Add support for the global clock controller found on Milos (e.g. SM7635)
> based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
