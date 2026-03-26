Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848DF348440
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517775; cv=none; b=Tc2KsH9bj0X254AZjqnfM69fGVvbKhHPhyg1FXSGgtT/karLdYZEt79eD/baglRb6ngCoWyX5BU0NLr668aFmVoP3FADg7aVrWPVI0PrZ6xDaGKdn6ZPkYJvesHY7inBiG2zKYtydiMIa/j/oyYl8C3e3TT6iETDGnnEhYRjNOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517775; c=relaxed/simple;
	bh=E1/qAidL7Jabx8QKfgkv4WL/0YNnbRnF+MDmvTejXTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSEY2VqOVsXFmUf9a3biA9P5GYrV+232sNR4l7lqeQPiuWacoZIKFKdAK3s2WbPEydto0OHURK/2NOX6ZBhc+prHk5851//xmbr+dj27V+IIaLj5AS9VAUwfWabUTSNQQQ6UlUUWOjOG4T2IH+IwpWWfhzPT8IQw2fHvMqGphDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNC3HONA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxgQvRiz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNC3HONA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxgQvRiz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8Ew111811048
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRQhfVPZa5XOckAOSYuNxHDJKVU+H4PE5kW8js6sf2A=; b=RNC3HONApnCc0ehu
	orOu4yN+S3QQDfnq5s/hJoIrDLQUv2UOtg5gYB+Mp2n6zSE+52v/+HCJlGSdb+tJ
	0TQx9e8nVbWX/Moj9oEYpBZ0dRPaSnEnRYoetk0GUSXlrvMXlvjGV/1IxYtZpWvJ
	RtkiaPiG5ENO4rkDsLndLzgs70elT6EhaJE2/Tn6PZfYS9+O6lDHa2q7LjKqUxi+
	BVtTION4dysy7XOYqJnVnvPsfZiwLsRcnENF98qfL6o6RWkhmYk5X4PTspSsLJ1h
	KgsjzCJOZjvHuiZ5RQMqkYTPSk0TMxMOPVfzmg/9cK7aHnWAczZ/uzFnrY+8J7hr
	ls4rLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn1kv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:36:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b317c4041so2307351cf.1
        for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517770; x=1775122570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRQhfVPZa5XOckAOSYuNxHDJKVU+H4PE5kW8js6sf2A=;
        b=CxgQvRizaBxmlNpHqDI54oF0VKFE5eIFRa7lRNrKTRe29Jy5OR4bv10stmXt1Lagr8
         6HG0eLDt+bhdwMVUy1Ym49S9f34RTTXZXWGr525F8BJbTJfs/x4/zgeoLLaWCxrJ5/sn
         OjuKTAg82OUFX+TdUllOPN+zJ4Wbx84Frl+J6OniNkVmQYV1yQ64tqYL8AWtovgCGcCP
         DnLekXVIhPrcemxJ+srHUOZK8z27zYpgBlcJd+kMGSkMmDb3DtDafRNN4KJ9urTZSZFl
         sK2q0yZTt1suh9dS4dQyZGhO1OstSc1JwAs1jbtzvq1DJs8BS1a/TpX4chsAdGpSxLEx
         VDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517770; x=1775122570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRQhfVPZa5XOckAOSYuNxHDJKVU+H4PE5kW8js6sf2A=;
        b=cduMFQ1MdUM0GavdhZAMoLieGjpstBUqwjePwLrAVUX7WEJn1Qqubx3w00SuREH9/a
         9Vjz9ZDh+KVHyl1g7SjBIU7Z05pgvfjKgCg2ZdYrHRvAnNDQ/bF4dDhIA+bJkzYWsTfp
         HYtJRq5AAQGm2+dHnlqC4Gh6yzJUB1SmlAC8KHa+Hlg3sL2Q+W1arb2D4OoM9wqwBAEM
         YhgHkRWwqfWbyVlnX1wiD1gTyzxOwsZ6C9eKgUA6CKX5GYFBU0lSED1Q68LD1LgMZjJH
         pLZkeTyHrvcGfvHiYczMJoT6sf/3y3cKP2hlYIp1zm+iv2WM/fEXiwYX5PM34ijCG898
         m3aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZu4AdQIy6kR9pQKZ9zBdwf43+EerMd9yNyWXpEGIDB4bOuYsftpp1eXG5fa7xtkoaySisSgWh2jSgow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvYne+q6HZrjKfwNk8xiGEhr+GMxSZZnBPBIywbb64zNp0vev3
	TESAJnWZwyVqe61sS+XP9D7xoazRH6sSjQIyGOsbxXbcYyjHvVNjRicmv2PwV4F+xa7JuUYztvU
	UQHo75mwPZN4oNR7j5FN2cpAKISK3Fat8bnF/tE/RTv8ifYTOQGGUXTHz6URZg9peOQ==
X-Gm-Gg: ATEYQzxXumTe8ABd3BKGKLkXmWrkRIJ8yJ/WD1qPdgRFXfecDph6PQdBrcWAvm846Qn
	NUjb+ChaPh37cjR7o6HSYCKsqLWgVCs+21RxNc8s5lLg6YewCjFS9yXfsjm+nBWM3acWkoN6amG
	gJLUPzqbsXvIB18JoR/v/1DlLCEuepVUepBsobBivZIoQMYkTS23dPowAmf9ix6thTEDBSrHm4c
	AF2Rd50K7pA785xwfcKlEOWaZsq9+Ji1coIuJ/mjAAuhKZl7joFLmINsCC2+pkjD0/OU5rlSd4g
	1hTHGI3yFezdweAHVfV1FCjN5GskNvEf8dwCKIn0E9Iv9Y9k/oxC0oF1I6XP9PQnEaBsqm4GvPX
	CTzT2hCsLZuYelaFPRO4l513iyipcRNcpxgg8gy0omEqCg/Js6ol9IaZHA9gyNcTmOpvtT/XJHj
	LGjoI=
X-Received: by 2002:a05:622a:7288:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50b80e74102mr46237051cf.7.1774517770168;
        Thu, 26 Mar 2026 02:36:10 -0700 (PDT)
X-Received: by 2002:a05:622a:7288:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50b80e74102mr46236871cf.7.1774517769650;
        Thu, 26 Mar 2026 02:36:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265120sm95130466b.16.2026.03.26.02.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:36:08 -0700 (PDT)
Message-ID: <d1c4c1fb-b6cd-4d44-8c15-1251d0f65859@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:36:05 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
To: guptarud@gmail.com, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20260326-expressatt_camera_flash-v3-0-e75e5d58990f@gmail.com>
 <20260326-expressatt_camera_flash-v3-3-e75e5d58990f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-expressatt_camera_flash-v3-3-e75e5d58990f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfXwa7TfKfh4R2A
 IyxrQkirz+bWoT9OQ1MzVQ4pZjn/D8PDv8ntvYdZrbVv1qN3mF1rClD4u167MTDnQ3w3cIWtyia
 PaOr10wvHl7/onrkLSwlFxWvjFbKTzoeyqplA/dLM9Ul0KSy2C03m3OxpfTU1fUuinyiaG23HIK
 QWsBby6FG9UYymid5uxinw7sIXgjJva4TzBVUPQLK+7oZ6/DNBcKSRG/973pDBohumdxq/JNsSf
 uDO6dc/oSyozDtcXDhYGMBcvQqfsW1CZXPovo4P6vDYYfvlHpTYxsI/Vvk0nCPYlhT2/9TamQar
 UxStbAHUkm5qetq1d0ddV01DIpinZA0K9T67OvqHICyG11XTHIb/6LOPXxXstV+ut0GJWF/1hqT
 rEjXOYD/C+gJvX69p3y7Vq2CbNaJmcV2CiqvPFM/rw1PtBpGEXUv8TnRF/ZhasMyZbV+hsVG2N7
 ro8jq872GNrLmRcllqw==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c4fe0b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=uvkyEGDT79mNzstEvEcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: udVmnMiQJMNVm42WldRV2cerqkXDhoYC
X-Proofpoint-ORIG-GUID: udVmnMiQJMNVm42WldRV2cerqkXDhoYC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260068

On 3/26/26 8:57 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add camera flash support for the Samsung Galaxy Express (expressatt).
> 
> The flash IC uses a one-wire pulse-count protocol on GPIO 3, powered
> by a GPIO-controlled fixed regulator on PMIC MPP 4. The regulator is
> modeled as a regulator-fixed node and supplied to the flash IC via
> vin-supply.
> 
> Downstream references:
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591
> 
> Assisted-by: Claude:claude-opus-4.6
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

IDK what to do with the AI thing, but for the change itself:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
