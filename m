Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58661A314C
	for <phone-devel@vger.kernel.org>; Sat, 31 May 2025 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748717332; cv=none; b=YSiRUrHSc9oqiZAWG7nsbdH03pJUdZ3K4RUv0yTDXdYpa2zcSt5Lc1sF4fQ92y+rVxq7kIOC+0dw5zFieXtWOaqB44YlkxTcg/uw+g4AveJTEgLU6IVGahaKqrXP5bRqdu1OYM2aEozbaLAi7Qs+1X0Gz7ctD2cduLsyhM4kx0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748717332; c=relaxed/simple;
	bh=twnMRSAjtTxRsTLOV3TBRxjz+geOQMUR7QVp+z8lBDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AeYO0eiBwHdTmT2fAWGs0sxEG2w2CaAlpiPvQ5o+wC6chWFux9MD050nGLQJHFWHz1KeQ7q78Un0TgWXLAWJv4gLLSE9uJhkZNH5H51hkuHclYJCZ+o23hAkgUXEIK/LIKOPGSH1GM82gT0WmXitlA4wr9xIMNUdr7UtKzCIGj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnZK+hfy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnZK+hfy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VI0aox015430
	for <phone-devel@vger.kernel.org>; Sat, 31 May 2025 18:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fq6UVpWTFma51ctoNBqE7AuMMwmya04U5DV/dQ3iAq8=; b=JnZK+hfyv1XyuO4x
	5QKELThanYZBqy59WIWL1V8nS2NJ147LveHw+6bJ7QutoL+kEqsqNzaleLRzpqFm
	/oAepbXDPLK5Xl6gHfRVnGij5W2VJn1QPY0TUmF2s0rlm1lpzVb4nqtwSLndkvYg
	B3hWGLJfteLFuEjt0ZJ65U7FfiMJsd7WZHOushh1sup2Ck/eB2rG0jsPgDZDkhys
	y2iZLOkitIUEvMUzFzhZJqmKRBWF+BL5pRlSxvI63EESPg5T3l+pVaj2WU2G/U4w
	0LbyDISVPzIbsADafH6OooG/BcyLRcEpggYdCHrmWGrWrDMiXWOUxdKx9wFq1nMf
	jyOfHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytxm1727-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 31 May 2025 18:48:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a58580a76eso258151cf.0
        for <phone-devel@vger.kernel.org>; Sat, 31 May 2025 11:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748717311; x=1749322111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fq6UVpWTFma51ctoNBqE7AuMMwmya04U5DV/dQ3iAq8=;
        b=MWz3WeT7ENmT3xDDRNQWzF8L0CVnDMMCfhin2aK92sEzuYUaZuUvdP5MmZH9nyKKFb
         Cgy36Z1gzuSmYKWHLXLz7skqZHEKbIX7yzUJBpdeaqJ29OhNb5CHWDV0M0oNbrhng+BF
         soq6HpsNCF1zSfdqqvI3uJvHs+ttLFriGR+soBIWyWOj97lkkkGZFWUeVTrPKK/3hU0/
         ruaimgaRsvw8H6KqFKnAYiBX4lcz4HxvWbJEGXAdeazIQO/I2u5ePl1+mRePw1NlayF3
         gW8xlObuafQGngoBfoo9ss/DmquxxbwrtJLawL5pUqIr/8OAtS59/d4XssRg8wejv5H7
         W9wA==
X-Forwarded-Encrypted: i=1; AJvYcCXs56jlo+0Yt+YHTdmgIjOnHPITUqqF1jkXK0qd5W+Cmyz3GsfpqY/bCGXKQ9YVtw4faUwEoCzGWmqOLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzShFH5Nl633zQvYcHSNFqICa07andAbf8fVKc7NR60jjoNTldW
	7UDrPQA/G9cjBBkQISoRIt/mKMyNCFJ0UDHnarNAoQxnKTarLDP/NVyius/1SB1fODWBbS9Iu3D
	1+/39yr4AiZmLLnXT9eQIXu1KPiFGzCPqP2fXRQ38OtJqXW4mBAp22G7bBQhQV4s7Ew==
X-Gm-Gg: ASbGncvnt60OV8bm3tFxRabgzxejhUgkCjTCn0xWp1A3W1m+VjBIA7rRJ26Pe63oMUw
	8Gw0sm10DaAbCzDOdYj+46TwdqcflsQbcYhwzMRsVPU4pPN4whh+BP+KHU4Yd3a8GdsnDVSx9NH
	NEila9MLW9b9+vFDIkqX05DUfUE52kv291wmmS8KCmmHP341xSM2bz3eB4S/GJa89ZdbnKZsSal
	rEn2yF+hL9oARJy1XMGv8GglJ/VH2qo1ttAsRtDv0Y9mMl81/NIRaGqNUhQwS6E4RKQ/pUUubRt
	UP1ck5Q1vsvMBPCVktWseX85Ox0vwMRJfPaBnMGNKQA1AKwyQLAJovSrHr1sjtKDqQ==
X-Received: by 2002:a05:622a:44b:b0:475:820:9f6f with SMTP id d75a77b69052e-4a44315f061mr44406801cf.9.1748717310670;
        Sat, 31 May 2025 11:48:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS50jxW6Qje29AU0C9sBepph7zG42LOAm/3jLmwP8x0sfmPiEZkOM44vaelCgiKPREG+C6ew==
X-Received: by 2002:a05:622a:44b:b0:475:820:9f6f with SMTP id d75a77b69052e-4a44315f061mr44406631cf.9.1748717310234;
        Sat, 31 May 2025 11:48:30 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c756d2sm3678883a12.43.2025.05.31.11.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 11:48:28 -0700 (PDT)
Message-ID: <4b4925ce-3a01-4295-9864-a43c65aab530@oss.qualcomm.com>
Date: Sat, 31 May 2025 20:48:25 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: msm8939: Add camss and cci
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
 <20250530-camss-8x39-vbif-v3-4-fc91d15bb5d6@mailoo.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-camss-8x39-vbif-v3-4-fc91d15bb5d6@mailoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 08wDvsQbdCqaWr-QpjqGbWi6RQfb6hVH
X-Proofpoint-ORIG-GUID: 08wDvsQbdCqaWr-QpjqGbWi6RQfb6hVH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE3MiBTYWx0ZWRfX8tNnu5a697LV
 6791BB9QA4SsceoAWVgY4azJPfhLD/mjpBEDbYDR5+CmJM4RcDAB0+85K9ZHNGqX8Pk//2JqZZo
 x5MsowasbjqiUSTsfx3cckVJLndnzcssni7yCF2uEPMAr1CG7/iHlnJx932ztjUYH1kwErxNoat
 27TlcyHZUnyFKiqfwfbExm8bcXtkTS/nqGdbGcfjJddsAt7RDlxYkxozlt9Qz0IXA+1pjrhY/DH
 E9bppzUM3napTgMfbRnqAJxR2XwwPhj+pH6PVAgGmyAfvpUr7d3Gv1nusaOP6j0OeIV1u9uPLgx
 8nTPDke5Act9IGgmnenfjueFP4RZtH0KrwfxN0N9ViC5ANHQX90orJuB4RdhE6NJR7IF7/BbPG8
 aIOfAoPcKgfXo73rJre2TMafhTL6qV+XfaIQQkH+h/VSdR/lBmVV9WN9vDOsW5TC1NpUm9UH
X-Authority-Analysis: v=2.4 cv=XdKJzJ55 c=1 sm=1 tr=0 ts=683b4f12 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=EUspDBNiAAAA:8
 a=siKOB1rTJ_YAM3DqF24A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=806 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505310172

On 5/30/25 11:00 AM, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
