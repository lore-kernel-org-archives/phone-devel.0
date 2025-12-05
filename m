Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09201312810
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928758; cv=none; b=U+YN6khAKiC/9CcQ5+vcxZBHw2HHy7LBH6CLVYQJO07Bd71vl7oQ9LmfrJCbUqjzuD0xs6wN4xr9PRnRjOpSlvHUk8iGfP4ZvTUSOMbA0m20gPL+uzZGhaRG2W+xIRWQe838JuRxTQoP9xxGQU1I+H8S8S87s9iF02gdTcLIwUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928758; c=relaxed/simple;
	bh=7bfq2TSle3k0LnaRhJTXusG/gbDjmiprkSipMvwpQ3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYjZSVM2oiPF0PLgK+ZqYl3HsbIakOImg/7CxEVIg/xPTdoAx63jh364ff9Xjs9y0wxAP0FQT4b7OBEDneGZU16jRrBGLWlfv4IasjBawwOUHQOHgajYGQ6A5H8Lm0AfhiK09B6YAIA8y02gRUJgq+MInIy8FKC5Ezq/iDpe8SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISx7Fw35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ljm0A5L6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISx7Fw35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ljm0A5L6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58rTfd2896646
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 09:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfjkxvihORQQ98r2FuMz6ihB2BvCC0Y9UxySzLl6k1A=; b=ISx7Fw35AsW4SF00
	kubrP+m3LnxDLNrzhLIFw/L7edyoRLeO/6Hfx3T3nuVZhEWBPMDcDzWpAk5LADTk
	1GfS1gSzDEuscOvsh3d5mL33meRRtAM0wyFV6jUp0CpL4Tk8CV4WrgqgGWor/4j6
	x/jo+AuJC+QMFzSb6+nPmJon8qGcs1BhlelTi9U4s457aSNEA7K8RBtzSC31577i
	CSsGhxuzeTbVFkFjGFAM6ob6vz01k3pPWDEpGpvd3lCH/5Xdg8PzKOPYQi03KFMK
	EJoRIDdB7mH7HCiyhfgF5iZI5zYwn9gEnlsOEEDL8BVoHYPueQUHdobUkfDePxH8
	9gKTvw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aukmj1j1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 09:59:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-882384d1cc2so6240286d6.3
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 01:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764928749; x=1765533549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfjkxvihORQQ98r2FuMz6ihB2BvCC0Y9UxySzLl6k1A=;
        b=Ljm0A5L6SlxgXyywoka5lIhGv9IL5yjIVPibZkAvyTAaayozev0YjB5DUvjaEok3UE
         zVaX0+irx9ZaF02/5TtVgjzAA+dIs7imkZw0X/6o0CSv3g6XHRx0vTo/SSWFxROUO/8I
         08RG/+QWhnVr9SYqiJ+23TfO97tmFMNKIWUXiz8lRGlSYvbkBfmnKaTDN5ZIgrZTRene
         q1eROqFAjx90AC8AGP6soc24njNuaX8RjmAiGoiuGBRd/UZPSzbyrRQTEPbjkv2s5Hep
         sJQ3hpPqlxRjeFjfEP1JM4OwAky6eSxxLM6tyNV30zIfPKFkMe/dghQKbWzvgc1kPbRg
         G0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764928749; x=1765533549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfjkxvihORQQ98r2FuMz6ihB2BvCC0Y9UxySzLl6k1A=;
        b=p/BLXdyKxodzhk2KaDcnxHeU/0P66sjB+Egfpq7N3eO+5/eWbU+9eNUVo2ti7MXh1F
         N9HoultLpOkszNdKuypMwbP1YoWGHgOmUlAcnIIzbYDvwcYNtUcHZzxgb63Q/n0u/i3G
         jUXFdYmbJ6xGU3XFhd61Hfciyz4zTINyIp1CwwmGLhSsn4UedzWpDFeidewhgVvptMZZ
         GJVjuJZzl5cwVl0+cyzDZV4+gMCfQaUP4fu0592YD+fLB620ki882wmmq+hrRqVI99mw
         GOpkmCFX1g6PO7XWLESzgXTcCWoqVBD55NAH6roIcyia6HDI1fAwjiqNefCBUhJscRpd
         f28A==
X-Forwarded-Encrypted: i=1; AJvYcCUD0bGYh4qyVCSiMkh9LA98uVCy1lkaxfvlpFuz+BW+nDjcWN1zCKW3Xvo0UrHUFH2nkJi+87MqNARNpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXhWBsUSCwo0q7RQg+fw+uUf2s9lJSrkbCvXVMMgw7FJJdD8dO
	TleRy9mBtB0obTzw5nGtJfThsmDdOvBe1rpyD7LwVzj85qYivvIQIGwqBQkcHHdhFy2N8e6vZir
	9QdOIHOYN+fQVIwpwrmV/n5f0NEeap6WUBJ3FXfsWQDvsoeDzUvwUtowbO8DGBvthxw==
X-Gm-Gg: ASbGnctO4p7c4v8140iolDlRDoUbaX5VwA5KkniR/pjQlf+sU354Lr+b3QigYxcZLzQ
	gdl5BkDMVMFwZ36piM4Bt0V6ssxHRFU8K9jI4l2PXY3+dAJangpmCruvHL5P7BB18PO9BfC1ZeA
	CBFp62g5wOmdw7UUk/ZEImJ3Pgo82feDx0ipUDLsFYpRWm0rZMXMH58rEXqt65YMVD8KIoKorB5
	ZKY7V9YR4r4WI9Avb9onTFhiYWIGZCMhtDvGel4jD+xb6Sj4VUAaAKzkceUsUeG3+7Nxlp5gvvD
	TIevvKUe5+2gJ6MH3a9oYHiHMbsmbGgQM1K0EPs6wL7e7p/6s+skknDdIXiOVnw7PsYXB5FRnyQ
	mOkzZ1TLI6QugklhmAUUzoS+/iUYPopB9jBVzLgG3O/tUbTJw4wnL5lXhYvdS65orJQ==
X-Received: by 2002:a05:620a:269b:b0:89d:4a69:1502 with SMTP id af79cd13be357-8b5f8c0c5d9mr868904185a.3.1764928749548;
        Fri, 05 Dec 2025 01:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpspM+ICmsmP9vWvYbDUrEEZofcGz0pLj1H9yb6JeVlYBv+ycT9u3vhjBrWF01Uj3As0jMDA==
X-Received: by 2002:a05:620a:269b:b0:89d:4a69:1502 with SMTP id af79cd13be357-8b5f8c0c5d9mr868900785a.3.1764928749071;
        Fri, 05 Dec 2025 01:59:09 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49772c6sm333401766b.44.2025.12.05.01.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 01:59:08 -0800 (PST)
Message-ID: <f556c32d-acae-498f-8abe-d79e99bb0d9b@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 10:59:05 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 6/8] media: qcom: camss: csiphy-3ph: Add Gen2
 v1.2.1 MIPI CSI-2 C-PHY init
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-6-6b35ef8b071e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcom-cphy-v2-6-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bYtmkePB c=1 sm=1 tr=0 ts=6932acee cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=ZFB94F4s4OxtCDoo8YAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 4ys5IOa3YZ_Lddct1gkMH6doKNILlcaJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3MiBTYWx0ZWRfX8R3cVcBkjX5f
 sRT9nSuspAV1z0bW0yUkzF2hNuA/UDHsjMbOZw3IRuNDv+AvmuVtVi8sXtkbopntvGG5Jv5saVQ
 zgo0RHR+xFWiC9F9Qb1ZBwAAiYtuigqDn6g2/6ZeAMfI6eML3BPwVIchdqSe7WWWJ6TT+FUnucA
 yC9itsDSWwERpL+xY7ZnBO6GdAJsRq5cUmYdOn9c5UPxx9lHZXyt/bSr6O6epLN9Cco6cMZOkyg
 aPCcitaPE5mi9oxCf2T7HRidtaLuNI9V+alWy1jtSz4Lauopdv+zRCHwt1EMVEk4WZQE1nAWZDj
 dEmxFe87MJ/FXpzbPDIANrP82vhdlTt24vhojGvjthp5VNuyOYmmJNDLr2SJIrtz+Jdjys0rztM
 4f6FXlux2L9wODK5ataGsrX1w6Dn+A==
X-Proofpoint-GUID: 4ys5IOa3YZ_Lddct1gkMH6doKNILlcaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050072

On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a PHY configuration sequence for the sm8250 which uses a Qualcomm
> Gen 2 version 1.2.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports three-phase C-PHY mode.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Matches what I can find 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
