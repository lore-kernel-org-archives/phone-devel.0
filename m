Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9B1268C42
	for <phone-devel@vger.kernel.org>; Thu,  8 May 2025 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714560; cv=none; b=GzqVEnwtoqQQBMBY3xL/YVWtUB5hOVGYTMSc7buitOXmhPz1qEQds+9t1vl5IqMEzx8lLCS5I7tUGNvLpnqapyW5QHGsx5YKebG5GufZffiYWFNZTaTEVn5/M4urvuEPC1vpCnh87vnAjONXULhgJbn+99dV0HdoiaVZX14F3WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714560; c=relaxed/simple;
	bh=Jbh/9af6d5ID3SFZRBT4G7nBI1lKLhOwQR45yMrSHko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfwCWtU/WIcY3GejYfqRJN+a9NT2GqWMIaedfmySqawUxciTy3c/nER2T1PUPNVm7yiIoh94HBY5oTdOlscjRiGMxc6FiLhaxpFTB3y4ooMXBASlIqS5R7VF137EpZTYhUZkQfkVuwTNK/hTWYjDNXCCXUJMkmXB4vx46ldbhEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hORXaO6a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hORXaO6a"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DoIub031737
	for <phone-devel@vger.kernel.org>; Thu, 8 May 2025 14:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVYdOyCWxSbmzL7wlbg+5YDo1V3ZSGq1/g/F/cp+HoA=; b=hORXaO6a9SMh3pKO
	xzZhMhWFomjD0o7QZqMQglsv9KACrmwcUpNNbIBnsGE+8EbUPOb1bHuYC8xRXqWJ
	FFPGTgfdgX8IfHcDuimT5UCJNIT5trm7ajYqiaHah9Sw4timIb+qbMsDGagophDP
	fD7K71MDNX1IGFQJygINl5TtATJSoN+6sFoM5N/xXOP3NXnNJW6JbWWlGPGrMPiI
	RiFhUU7eU0+6znr4yZEiGo4XVs3q7fIYoh/t2ivqYGZRnLjBTE/bz3Hw/faz0W/k
	G46C+ZJ0F7KZ6Tw/N3N8HqFpZ7K26d6xUkRZBglvjs2rjgukFMDBYgT/SDQoGw02
	2mtCMA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpghjyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 08 May 2025 14:29:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so3181406d6.0
        for <phone-devel@vger.kernel.org>; Thu, 08 May 2025 07:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714557; x=1747319357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVYdOyCWxSbmzL7wlbg+5YDo1V3ZSGq1/g/F/cp+HoA=;
        b=JxVpt+PW3TZvxnbXnjKTJxq5KRXtfU2GgOMZUtz4SFAo7/WLwb/TIXik5LyB1TTgf4
         g+oR9MHtIP814VrDOXOsuZvGTsdQxflzjwUeixRFH6v9Pet2oMkLy43xBA/ifjzNJCEM
         jiOweTamEOKX7z92Uw0dME229JmvgBs1l2qCKXQMgItuWEX00eat3jJ3dgbjlQtDqKi4
         2p2hjrOsNBh758YRs2pHSCTPki1U24gAQprPops0+q/yNUAetCLSvJF8dbiwD1tQZy6Q
         FHmPrcDgnzYpDoFo3d8Yz8Hp3m7xDJKH6uMB7wnbIG+roNoD2KsgRuoVAIp9fknDXHVa
         dZxw==
X-Forwarded-Encrypted: i=1; AJvYcCWdKOywhMb3FtAnLenaS3gQe92EjcOlIh7dCKWfvV2xe8JoZjTDf+bIeLtEX040KISadBSH+FjIQBekqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjepZoF6W8ERY4MSybpkNOJIlIk77bZO7dg7bYoS40vufaHD0O
	lBazAPC/QuJriq5uCp8t2XtJ7lx8UQbnSF30G4xukGsf2mVYvcGNFLZwgMfvKtxMsYgjdfgC+xs
	J4j8eIy5A7bRSRb3ZZXoVynWU0GaP3r+qQelRqAty4p5DX/WQmsO1N4u6PHXDjnYA5KTMpA==
X-Gm-Gg: ASbGncu0YKrbld0BnIKyZKxl2YLNOzZcr06ztgbuJ807sye0qhQk2SI1QBY2Q3z4Der
	nwob3ew+pdQ5VjTeNP9GAKlLCqFLp3lY/RPAoL9dgR/9dcU/7AYB52a64CtXB1Hb9FGAfM+Yw81
	K71ox+N5dXLYQitH5FWpQJ8Npjvxw8NtointeszqB1vyGqZtTKf90lpbis12K/UU7c3vceKbPwl
	O2JRkT5AW8vgoQ0T7pME7iPBTLqLVoYX/qtn36ixfNkoyQHcj/d1qqSkgbLYobFDkXfq2aFrIGE
	jesvtNzXUU/xPfpdF4oT67X2Mmi/NUtySLpwLBKkfGtcDPYG47jwTooN2oq88WEKNw0=
X-Received: by 2002:a05:6214:f04:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6f542b90f75mr38377736d6.11.1746714556821;
        Thu, 08 May 2025 07:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz9mHXpt3+OIRXdPn95Ms+NqkqUskqTCeWS3quvvvRzqN5bTNhGiO6vHKI+hmpfTr1sFDJqQ==
X-Received: by 2002:a05:6214:f04:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6f542b90f75mr38377606d6.11.1746714556447;
        Thu, 08 May 2025 07:29:16 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faa42f65dfsm10180410a12.38.2025.05.08.07.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:29:15 -0700 (PDT)
Message-ID: <ac96227d-5b03-4309-b3a4-5c7cbb40a057@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:29:14 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8226-motorola-falcon: specify
 vddio_disp output voltage
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <6143603464a65aebbed281fe6c6164316dd07269.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6143603464a65aebbed281fe6c6164316dd07269.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681cbfbd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=nFJzA57K4K8usXJIcEUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyMyBTYWx0ZWRfXzC8qJ1MJ61dX
 9vt8AH0vPTAS//He90zAO3TLH+EpEHasfv9jc+udfpHx6e2NqvtlckrvNwXUj3iI5aes5WZWvT6
 auzkAw3VCBl3qOtwC2HuSkqU1wwWoxpcCU7izgKGzjsgP6TxCO+9/EK3nvutWHV85QbFTIur2JW
 wRVTJ3Dinec2KA+F1oXlJbv+A0BE8R9vm5Jc9Xg21XMYhyX7vesM9d9BUkkaAepirsc6UiNJxEh
 RJfsB0mWK0nsLO9dMQ9qhwZdebZnxZrlCoF9rs0pDvUlJbE31XPAawMoayVptTQCuNHGHjyF9qk
 hYhPmbfkT23nMQN+BEsFlS2bdCfnHFt+il3Ou9PtmxWV4N+CbuY2AcJtSqQZX8dS1TkW9Pdwpu8
 pWdFa00TLd1L4It6V42tfNAhPe7shs/iBqvgeza/TYAOZ9vA+u2dSNrxrUVjF0CE0l7ke+Yn
X-Proofpoint-GUID: pT--rx34WrWQbJgaoq7sTJuF7eitA0_F
X-Proofpoint-ORIG-GUID: pT--rx34WrWQbJgaoq7sTJuF7eitA0_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=958 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080123

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> After some digging in downstream sources, it was found that the vddio_disp
> regulator's output voltage is 1.8V. This is further confirmed by the
> troubleshooting guide. Specify its output voltage as such.
> While at it, add a comment specifying the IC, which according to the
> schematic is the TI TPS22902.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Not sure what the troubleshooting guide you're referring to is, but
nonetheless

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
