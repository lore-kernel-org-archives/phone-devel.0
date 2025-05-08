Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A7C28F4
	for <phone-devel@vger.kernel.org>; Thu,  8 May 2025 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714642; cv=none; b=l3cKF+A4H7ygLoyB1XGZGE+NB1SoGUKIUCBozh5v7pATscPTiIxP3vIgLeYKehXJdvFWjUzXoWcXbcNPREh5nWBmp1BZNYDMQA8Qz2NPqvD8Cbtvd+8t7ovfGi8szDxrY5II3UYKKHzNUte5C/mkRICcodj3Fqgl4g1sPlxuD80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714642; c=relaxed/simple;
	bh=t4oLXiz8QfvEsARyF6xExsOe53WBHk8ZMnYpTzjULGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZYxMJcyBU6tlPyy7i972Do3I9HcpRYkRRwijY4ovN6YaPQVsSHElObsupck6T6e/7z+J3KzIoWF1ef4sxMQVxfFSDy8AG7Yf1nNKpsg6pKknYvVBJGr7FNuCbFxEpWOYx96/TKBPQlSAH6xOoCQ/mfEpxi2bHCik7xvDkQllKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuXlWv9t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuXlWv9t"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Ckwoj010134
	for <phone-devel@vger.kernel.org>; Thu, 8 May 2025 14:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqFrO+71U8ibQ3gpsHV7HYk+y8vT7OVM8bBAwyHrapg=; b=TuXlWv9tZ50cNzlA
	VxNCh8Dw7PETMDZTd1RX4sprzGJ8jxg0iKvbCRrW9a/YGqHM3kfs5il4hh5o04D8
	MNNn5AGiIgiX0a035xPOZLeMgdvR43Hq1RoFrm9KXdNrhq+1VnZ9xbQViUO+UFHm
	tEO7O8zznYIaib8nskpb1HcVoHuqeiowG+GImxBIikz69S6ShSAq/TcT4XWGlOvd
	FH6oZgtd3mf09TjvPxAuQJXx7YF8wRZ78/cp3uYPep1B25zQWEqMP/byaWvGgMcS
	qorxqNwrT6vwM0vu+TdHKpEs8QH+fNiARxSziGbiuW2esQe/0cc3R8AZRoO1EfnL
	AaA4QA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp79mst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 08 May 2025 14:30:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c552802e9fso23161385a.0
        for <phone-devel@vger.kernel.org>; Thu, 08 May 2025 07:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714639; x=1747319439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqFrO+71U8ibQ3gpsHV7HYk+y8vT7OVM8bBAwyHrapg=;
        b=bnJsXTP78QLZMxYmVKDzTMLO4nvvebXs0kuy/j7IkSvOAYSuJjzCLR8yaqv7cRpQtH
         XCJrvQEg+9JFUGyyTTFKJ390JbH3P0JwdlUz3TiGMm13oskUhabuPNLfXi52T1r0Z2qS
         H0ddC1PSpyABC3r+avWgYBF4d36olXFkG6SAFtS3Och7zzottudTlg6YvUhBMtZc4331
         ieyYwv+dsboss+aKO7+9m0QZYkx5+5du/K9v4c64xxMchmJL+xVgY/9mAU3a99/81EuG
         fPwhmEhT0saXYSxUgwqJLSRX2tw5GFvLjgf1aXlAHP9njMhHACjHKN+v/Ixu7uwkI5Dj
         Oz/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzFcoOnCUERHVOH+ur7F+s4inkWalmdzYr72iuxetHKDAyR2dClwiqdBBZn5X6DFs/f7+OVj1DBR/IyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1SH3sQHjVHufmtdRtsqX6SL6TZSNtp6S1/2wa/VEgu5DpJJMQ
	WRo6QHG/n+HCnCsXsBwpAw+e/hOWnroXyfircyDAnIELkQziGfq7Y0bNPrmT+jFVPNWe9KYpCkY
	nlE/ziaEEHqshoWGvLlECAUsUV723dgmSxiV1qLTXbeYKvis3t9L2hM7hrSTjbQ==
X-Gm-Gg: ASbGnctbMeV0noj6E/eWs6OqDNwn6+ub+w3xArfufZKHOxTjfgCwyV/Bl3YQ2uSnc0P
	YyFwnWw/HgQAqx5VqRfy78Chn98xTFh23uwy+Qcohd68DZ65c2KPYoerjHjtudQ7fTdPmUyFmhY
	7CpzR6BEuyVAncnQfRmo0cEsyRwKFEGMeXeqlXDBL6mTaQ1hJuUzWQlEKRL1Owa4tMXUW34H7Mp
	LmaEvK6aNS8Yn6XcTGHvb01XBnGw9kj1e8sJMVvf5PkoB5vQhIqp+8ilIavIsSZfM+ZDLwa09mY
	jD3SL96k3yDn177joDq+qig/wh+2b7A9k+Ey5aYDyUT9k77LDLNCD/RLwCyT8GMDzUQ=
X-Received: by 2002:a05:620a:f13:b0:7c5:79e8:412a with SMTP id af79cd13be357-7caf737f08dmr455457985a.2.1746714638997;
        Thu, 08 May 2025 07:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFERWPG6KvKc50ZOv48iurNgCUBU1wb1dtfWuaQD0GVFc2xadC8U2UgV9n2hIN+6mOuzpaQbA==
X-Received: by 2002:a05:620a:f13:b0:7c5:79e8:412a with SMTP id af79cd13be357-7caf737f08dmr455455085a.2.1746714638460;
        Thu, 08 May 2025 07:30:38 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147403sm1100399366b.13.2025.05.08.07.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:30:38 -0700 (PDT)
Message-ID: <314117c9-1865-4e33-b7bf-5022869412ae@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:30:35 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8226-motorola-falcon: limit
 TPS65132 to 5.4V
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <b67ed6c7813fa52cf00b473dded9b5042102f593.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b67ed6c7813fa52cf00b473dded9b5042102f593.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNCBTYWx0ZWRfX7Nq/rfPurkEd
 6Q7RheL2yZPgYGL2+x6lSFWhprNLRpDT0yDXwDpEg6NSRDOp2iO/Jq44onmRhH+qFM5MT6fVbgQ
 yZMBMBajCS8eh8ZoY1JFGlhE9nvagkiyzGAGUNVZzbyUtUCSprP9JhPyTETZXcUZsAezuPPlUw4
 NHqgPBo13ox+YX9yPawK0v4d/EED+gw/2PGPVzt46r2UYBfDAljxTGQ4V+3P0xKIOGppWolKIty
 ZZX4/tD57HXxZtJ2Ljhpf+g5xrz5iBykKCeS93l9R+kaU5BUY9SdX0+jGw5nE/UPLIzNcDLVusy
 VfKgvkK0a7bTPYx2s9mShhVk6wDWW2GW4BzzP6qXFSl9HCJuA2RGT0vEspgRiMGeauGTwHljzlq
 2CCfxLs2h/zCJzsc4lfoXueOzQX0ddXy5G89YpLScBjthTTEWovHePlld/gZ4H6oYPxw6jUn
X-Proofpoint-GUID: XjeA0DOR9yUMqaDir1kr7Uyd_5DB0L7_
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681cc010 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=p4YvtlIvSzqog-DnsKAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XjeA0DOR9yUMqaDir1kr7Uyd_5DB0L7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=801 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080124

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> After some digging in downstream sources, it was found that the TPS65132
> outputs are fixed to +5.4V and -5.4V respectively. This is further confirmed
> on runtime through debugfs, the troubleshooting guide confirms this as well.
> Specify these limits as such.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
