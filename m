Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC28A43F0B7
	for <phone-devel@vger.kernel.org>; Mon,  7 Sep 2026 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770182; cv=none; b=p23n4834a+xitlG5j8Wk6KHFH2aFq5ox2u9ks9a65FoVdliqlLhUU3AilKr7ijMjXDyedTXJy8vkZpe4btmxWLb6xD6YtTExTHAOMRm/g1WHk6h5yDxpw988HsXpCZI20uqKTp4VPziqt33EgbaIZnCzAGId1gqQg/Z1A2Jxja8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770182; c=relaxed/simple;
	bh=EpBUO/pktu1LI8wvjTUn06mzyNUlC5RiWOtI6lhLAN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6VMq+jdtNY7KZ9RFI8fNJ+i3gyiN3AOm7I9Ty49Sd5xdRzTDxm8k5ycOBxWQSdnMIjADV8DE9sntecV/NM/+2u9pjA9LzqgcM26C5OPN46jrm8yVqpXp83byzqOmX+AEDhexsXQAAIt+58iROUQNVwgmZzFRxsDatZSh+Daa0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4/mycc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJK+SZB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4/mycc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJK+SZB1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777X3x2724146
	for <phone-devel@vger.kernel.org>; Mon, 7 Sep 2026 08:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32WO/Xjsl8YBeCXk6vwKWTCZYT8FK+KYc95D1qtSyg4=; b=a4/mycc7VI8LHTRW
	PvnoRVwH/wOGERBA1yQa40Q/RMmfXKda5WqR2myYw3gu9wdSrE69ojWYoF2JQo8K
	THtCUfpQQMxPifvZATjjGLQEwolM66QXDJToEVZD40jAdV/vopAfkhXMpulOLjR6
	44MYbNdVqeW2ZjYF7uMqbC4oanrz+7EW/lYbrssJOUJNTeacBKALNDvX9UGvM/6x
	m6jD8W6N3HtMVfBhdVVAQOvDo0MhmbcQ5huG18ziEn8OV1yGUjthJqFJDFDo7yEF
	kt5AaByK2nJKBo7tOy6Pp8iXjU4hA+CLiq0PfLh/d/XxxcOwY2VSmVGQ0qG3XDfE
	sKhhIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxksrfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 07 Sep 2026 08:36:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so5253521cf.3
        for <phone-devel@vger.kernel.org>; Mon, 07 Sep 2026 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770178; x=1789374978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32WO/Xjsl8YBeCXk6vwKWTCZYT8FK+KYc95D1qtSyg4=;
        b=PJK+SZB1wd4Q2tCQVle1fQVf4ID+feyIU/SfAuNfpZ1GH28mYDVvD8IMW+XI0Lunx1
         10no1k+G/1ieS1+VxFYwoWgPULo/V++sP83j+2tT7VMuIoH1tkn9R8haAejrDGr44Shr
         Ry5cUizHrYYcN43CU7nkoDAKJgfaqsXPQvtjTxk2FMv2C1/5R8zp4hvHMrs5uJxsVO5L
         6wEYJtaGLYUj/DuGV4wkpQD0gIDZFi7ytLyiOL6eWKsRYn3VhAyz1mee1lcOOCDGnCYK
         UsImCxy7GyRt4CYy7d0J5XNJFrImjpfNXvIPt1STXqn0rJ1BdlS6bSQYPw2bJKReXS3D
         S43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770178; x=1789374978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32WO/Xjsl8YBeCXk6vwKWTCZYT8FK+KYc95D1qtSyg4=;
        b=Lk+w3+n3Cd2cv3T922+VzDh3NTor1EJCtJhQ5BNCK3I3W0hxPoLWgeqIORi3e8+0sk
         V15hm4IMftfRIrXTZ/GFsEG8uWvErnWTLJYivKRLyW3uEeOWCHACG3OkbAP3uB+qV30S
         o1JIcmOOpMHablV+vG1SMYz3iutxpSHv+XGrsAxku25f2CRBo1jHH+O8InsG77/O0pBf
         wehpkhmfM1cf488j1DqUyOJU0rYaOwt8pL3u64K9FO5/24bN90wgrmpek7Tbv9RQuvQP
         CszYIPdKdzvbMjzg2op/oP7pAFte33xd4oFuYNw9AUi3ju2GbKz7hEXxrHZ2N3pGoere
         s8dQ==
X-Forwarded-Encrypted: i=1; AKwUvByxqEMKg2AVLtVgDN6d7C7kmZvKzwJ5BGYKm9N7k+nIbhIu5epPZhFMEn6X+PpxZnNOklGVS4TBoZd6zw==@vger.kernel.org
X-Gm-Message-State: AFuF++lqxhBoMXDoS2wlL0HUeZgrxfU1tgfHQEPEyHTHZZcm12VTXzD7
	aS90I/NOsve8kk7Oj6pyduYDFbKe8iGKo2PgZV0jNIz1qjqSDoIeRXjgx6NJZi1tvQW3DcVxch7
	7f/boSoAS7pvxJoxl0ywS1BXs9veQzZTLJyN5hI+91jGikxMBQfD1LkmlnwpFlCFNtA==
X-Gm-Gg: AYBFou3EztCzJZBVy7I4+yEr4q6112HLxg3F9hkgdz010FospzQhirpo5CyQJlebyLM
	75ScBAPwZwZtMx4agy6HdND/mw0i1V3Uk59Krr561XFV6EasM9Rsk4F5jyI4MuuFrxJ5xQu55ba
	govP6k2JtohO4O8FGMomZAVbghbtbvXiLrI4rrBvejntFQpq60GyvZym4M/MhlnGKRRXXHI1q+m
	mPvzpLu7ZUDenP884oWS1Gu3lXkv8ygG45KTPy7E1Q3EQ81YNzOiKyP19/L9D4ODzfqcsJBRSUQ
	iTWoY0gKJ+1XecU7T0G7QBWMH24DFlbPAaiCBT1aTOBFEPElbcSi1fEJHWXL3M56/osDuKcswYC
	yM7JcF4R4PRVw29F9k2dJiA==
X-Received: by 2002:a05:622a:3ca:b0:52d:8270:8e36 with SMTP id d75a77b69052e-53064793ba6mr120479951cf.5.1788770177990;
        Mon, 07 Sep 2026 01:36:17 -0700 (PDT)
X-Received: by 2002:a05:622a:3ca:b0:52d:8270:8e36 with SMTP id d75a77b69052e-53064793ba6mr120479771cf.5.1788770177667;
        Mon, 07 Sep 2026 01:36:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3d88sm3973687a12.15.2026.09.07.01.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:36:16 -0700 (PDT)
Message-ID: <b84cb955-2ee4-4865-9bb6-3fec074f451a@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:36:13 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] soc: qcom: Add modemsmem for Google phones
To: david@ixit.cz, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Petr Vorel <petr.vorel@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
 <20260906-modemsmem-v1-2-a3634b553841@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-modemsmem-v1-2-a3634b553841@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX0W9UgmwjERw8
 Ji6IQGhIM9HCpnPhPURs3Gm5AaOO1WCulj/fylkQ7Ud8P5KfY3GvQB7OyXKTSUNKSgZalpNEAbz
 3kw7VcBTcKHoGaUQX4cP/SFMn9miNdx38X9fThM16Rgy+8K9+LQWnwUKclKyaNdxFwYOB//6OLv
 Iz3CdMJmAe4l5owNiohJ+ZSEljob0jMXWb1BoABrfwD2ur8W9KTCaQoxFLzX0Lttyb4P89DdMUx
 G+Lb7w4QskC6oV3RjGT/7W38TYn2oFFPoQrTDWduuqmjB3qwRI9C/8XpCiyomkLZWeUag8TSz7w
 5PYS6MLS4LM4zmIJF2x0gvcm86wM9kSatPOgOj5qyRgIPoLfhgsntzZzR1n+/ImcHj5HDrj43r8
 MgwyALRIcwBP88Sj56yYdBwRpsJ8gdUeWcxAtGecRryCaAHs7lmMZo3rOIQBkds6IdaQCtrKGBC
 O4/w/miZZTazl+wicEg==
X-Proofpoint-GUID: mzTxQdgdf_CZgspUtj_h3FOsFVcvyk92
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXwUfE9d/IhlrS
 A/jg3LLV+kiVe4qlIlRfIcpQg2yIsKlBUq4cxWxHIDoFbgOoJj6s4Qo9uKyZWxQ113+/wl3I8AS
 VD9NXiCqY9lRZqYiITbZdEMJcHpQrbE=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e7782 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=SIia9Xva6E6vu_7LpCQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: mzTxQdgdf_CZgspUtj_h3FOsFVcvyk92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

On 9/6/26 2:41 AM, David Heidelberg via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> Modems on Google Pixel devices require extra information about the
> SoC to be passed through a vendor-controlled Shared Memory (SMEM)
> channel. This driver provides this information.

[...]

> +	ret = of_property_read_u32(dev->of_node, "qcom,smem-id", &smem_id);

Is it ever not 134?

FWIW you may find this useful:

134 - SMEM_ID_VENDOR0
135 - SMEM_ID_VENDOR1
136 - SMEM_ID_VENDOR2

which you may find in various downstream kernel used for various
purposes

Konrad
