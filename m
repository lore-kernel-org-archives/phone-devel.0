Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172A02EF654
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 20:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762806959; cv=none; b=adwgehMF30iyDfe7jzSh1VEHrGQ0o4i6XeTKrwEkvqDOYB+NE2htW8qgGJn6yplNPiQVixd3ZnSQTZV1ALgXOu/sqFWBa/JZOupuIbNdp1BPQVvQyKv49jNh3yb2e8W+LJljXov76TNhiWkVjRMI/swCpwNx3D4VH3N35gqSN+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762806959; c=relaxed/simple;
	bh=6214/vB/U2T9ZxG1wVNkrl1tZxoGhwbwSuU0K4bc0oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMoFf13v4coW9nJb0StF9NPU9txSL4dNzwxM+UjaDeChSGXps+Kb/xtwn1B1X1o9EoLJOEr1LezxY110ZBXTb3P3R3BuoHcJA1cEZa6rmeXSek7RQO/gD6OLDLij94uL5/mUOyqFTggCNnpeLpZK1GIwnzIEf8DBUTK7Mqt/F8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8QbNoBr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ot1WIuoZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8QbNoBr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ot1WIuoZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACMuBr3306787
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 20:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HrusHWa4xpz02NNq9Rv00ajz
	hsc5feN0A2MEhrWFj7Q=; b=h8QbNoBrG44TqkkpXtfasvkklbUzYf28BBnTtLPd
	CVq0Gch/ivO9Z86GYUrPpG6y7SDtJBZvkdDPeQI2zrhP5LxpDO1zR4ACotuTaO6N
	2yoY+57FkIBCWaPs2Z5fbg8/okriYWLgZELUfCVTFCyzWKgCYT9ltpSE/dhpplLF
	JB7J2XG2WsCJHMh5/+0fg7D7GfJe9Kf17kUYhyG5SNrUclP7ATSVEA/+IzZFb/go
	yXMwQd10dGgodh6eqzdshBR8pV3fMzk7nbDWV49RvrsaZHH2P5Q4MDiuCXjUD2Hm
	JrH/eFeMAJWGegHu6rtMwwSFhZNdk8Tg3w3trcRQIGdX2Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0q9fap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 20:35:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74ab4172so104979541cf.1
        for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 12:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762806955; x=1763411755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HrusHWa4xpz02NNq9Rv00ajzhsc5feN0A2MEhrWFj7Q=;
        b=Ot1WIuoZr1jXGaqKoID78kWyRMNSsc5aJAKI6EA5t6nlzvPpgCL5+/8inKsVR7B8xZ
         mPsrwZod4f6LLOUOUuHF+kqvctd+Qp04n9+X9lNnjXE+foynGJUKbcotAE5VvSDPmZob
         lYT3g1MRurw7HkISrmGVwU2XSVCAJkD0TgKFvK5TnckHXmZgTZo5N3QFXq1E3DGv23sm
         3nlIljBgerA7ppqQW0SOPRXamgB5TR8unz2MJqhj/9soZqs6+ZM3im1UisKnvESglv0Q
         +l0/sWF3lKYiVxLeFtOPLEKRvA+nTKq4y3MmskuHcWZbVwqNW4kyp87cYe7xHSafxRWw
         PACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762806955; x=1763411755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrusHWa4xpz02NNq9Rv00ajzhsc5feN0A2MEhrWFj7Q=;
        b=Tl0wMCDyn7c4w2YVRRPahYycymxVMFoQPwFZdeSJS2wfzs83U9JaTEBXlKJ05y+k4h
         nJZFBjbFTaZUpjsDmNMJc5uuunvJi9ZiBO9Nv6ldJ6YA3Lh57MrlPEU4sqoVrwZhMZAu
         BykCOhsEC4iWmDcMSZF1xzaCHaP+B6xvOAltJ9LhOiyT4F5FNXUWblTsTYBNYrXDY8zk
         S6/VNE4hnlHC8VgyQOo85rIxk+vavdadvJfjt0eI8W5Ph0Tl6Zu0+VbcHDU7ZJpGqFF3
         WKJ4ESsO1zyTXJx35DxR8y8CqU5QpmIDCWa+oIVLveF+CkDbl6cAlE/twAittj+S5/AH
         r/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlnzcddtz9+zZ84zNQsJno0sswwL5ifCKMl0vy82x85SDOdwL/B6IaJds4kH8aux+J/Yj6yyL8H2IItQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdNDFKP8TcPVucR7hSTF1JlTxUI126ReJnpfzNAlsvbeH/JnWj
	IDsTRUkuvegs0FwooUSQb1VQnElT7OE0QfqSE/tLMk25KzGnMY0BE+St7f0OcpCqlm6G9ZslRll
	sbmm3O7MUl007nn98CcHo7Xj/IXDzrlDY8VOIX8bC/ucycDvCum4PZj0B4T1yzgVPeA==
X-Gm-Gg: ASbGncvCI7lAzf0SLLtylgR/oOcAXq9LCVss3snF+SreKVktflwri21+ZF/icuhtZ+2
	h38l9w3n8RsxKIpZoJCMzb3Rm7ZEYv15emHd82Yt1NAKItWgFwCthg1dLXa+iBFU6lCsdYlSpVK
	zXl1VyN5PoaWXfcJCC/LPEIXd9YqsmPkmMQ/mvlgL8F0N7+Q+eMAuzEPn4OXqhLtqaSOEnwALTZ
	IJPZJIiQEeZ7CsVWnqTY2CCMpt5w5zRv1y1pOVsN2aYxCMltReCpNaaiFWEig6cAZsfAmp34W8F
	xCfelfMB0VDQ6bqsgQMwxKgugFeVmwszGOxr32J55Ty6d8gjhcjOO0eCygbRHpEL0uru3Mr4Emf
	Pyfpr+qMmvb+/a6C+k+UuxiCfO499kIHidF6To4TTdgQJ1DGHFscGbyJ2Xzw+14ucMaDkzWV4oq
	quTSelM+uopQUG
X-Received: by 2002:a05:622a:15d1:b0:4ed:67bc:50de with SMTP id d75a77b69052e-4eda4ec8bf8mr113489751cf.24.1762806955278;
        Mon, 10 Nov 2025 12:35:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ5ssDcgmggW4lpYvEvrEq74tSuo8cOVQiuKY1y0jHjepaZLONK7Do79X9y4s2nxZqgmpA+A==
X-Received: by 2002:a05:622a:15d1:b0:4ed:67bc:50de with SMTP id d75a77b69052e-4eda4ec8bf8mr113489431cf.24.1762806954848;
        Mon, 10 Nov 2025 12:35:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a013bd8sm4360891e87.1.2025.11.10.12.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 12:35:54 -0800 (PST)
Date: Mon, 10 Nov 2025 22:35:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: wireless: ath10k: Introduce quirk to
 skip host cap QMI requests
Message-ID: <xgyd3ofvv7blcfo2iw26p7sh3p7lkb5w6kkbogryzrgytkrmva@foo72an5qs3y>
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
 <20251110-skip-host-cam-qmi-req-v2-1-0daf485a987a@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-skip-host-cam-qmi-req-v2-1-0daf485a987a@ixit.cz>
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=69124cac cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=bBTs48EDRqzxHWfT9_gA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE3NSBTYWx0ZWRfX4rx8UT8Xhjj8
 OSXVvPkgehsptdd/xVj2IgwOCR3BQmrYdx4SFKa0cOQyZuAaz/uodvtuTfUGanw+a6jKsk6F0oT
 16ZC0w8lvqDlKTTut9QPlI12ekc7KlobewGT2ZnOhtPq8crjmX0lOYwW7zYVhVS66j9zUSES9Ud
 5Gvo7QOl+DAMSoohYRqiPgwIJkDry0Nu4Ip/yvX40stAfwdThpg3FK+NG5B5tt266nBneZ1mEQF
 LDRc36F+pnuUSKVKbFbGtY0f3ZdT5TZvUJVWLMfIS1XuFNZHrOWE9yBz3CZoWm8eGIhrJPDAE/J
 DFLHcQfMi6p4WvtHIhW6gIaflFy0VKMP+LNK9LbHmyADXYdvdS7ckKc9aXYAVj5fvPJkjewB/Aq
 QlFGXvkINeQlbD7yzDfh5ta14X9amg==
X-Proofpoint-GUID: 7sw9-n2j2LMXF0FxvrUECAkX_ni24nYS
X-Proofpoint-ORIG-GUID: 7sw9-n2j2LMXF0FxvrUECAkX_ni24nYS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100175

On Mon, Nov 10, 2025 at 03:26:24PM +0100, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Introducing this quirk to skip host capability QMI request for the firmware
> versions which do not support this feature.

If it is a firmware mis-feature, why don't we describe it in the
firmware-N.bin file?

> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

-- 
With best wishes
Dmitry
