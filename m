Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9368634F
	for <phone-devel@vger.kernel.org>; Sat,  4 Oct 2025 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759558711; cv=none; b=fkgrFf0Ugy1XXsVV56D52IjIQWhUG6v1Du23aZeJIVgHP5nqT7wCGlyHM1t4ROPQ0XO+7NiA2cbMn/8VJU83yzL9ek96SqurpO9I0p780Fgi1nM3na87vU6JyFATFAbLO8XflnIxjYFetiTzB7SrNv8/8uwvmbSopYN/W5+zPYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759558711; c=relaxed/simple;
	bh=Xb7GbdUMgeFO6hGVfbM8PH1E1ogGhUzLWkc4jXBM0Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKKaCVnS3Oyzl/7N83+IQ/ylnRtZoJxZjExir6LPNYZEcPMpyQiRqM/UvrGzv4S48StuDq7egLQ+HFSnp8RooBd/LbaZElqdxfqMONqaB9AaT8DrTAO2O3DCr7iK2Zig90Kl9LwWy5d2ZWfCQoEgQHbgTm+A7HL1KZBFID1D0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaUBB99v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaUBB99v"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5944Bp8K010196
	for <phone-devel@vger.kernel.org>; Sat, 4 Oct 2025 06:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tREHhzBNqaNszskLCqYldCZ0
	jlzI/Dwijuz01+c/GDg=; b=aaUBB99v3DLAUpvqqGdBj9Me9Nnweq28bOfRNTBU
	TmjVXBCeiP5z1vUs2/yZNjXSXXa4PEv9P7QBrcyxba4ef2KcT46Bxo1ge09Ni8ms
	OiP8im9zc6swVzUcRS/Lg/Y5RpRJH3yEo+nJ1ikmrghWzNzve7WLjGaiMbqsgpc4
	H9dfjdCSueIR8lFTmrBm4Pr1wH2bPUVbBGpcgCFu1UVUBk6kMNIGTeZ0MGojfPzy
	LoIS5IBmiaXh3gMIo8KouP/LKXvz7Id3retugloLEllY8pj+nyqdV3CtvK+W1py2
	4WqAA8j7fXXi5iAQs8+SmV7i/vGp1AWZicG7pp/zcXGhnA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvbdg4e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 04 Oct 2025 06:18:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e576157d54so40947331cf.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 23:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759558708; x=1760163508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tREHhzBNqaNszskLCqYldCZ0jlzI/Dwijuz01+c/GDg=;
        b=J9suCKYcGtChtzRGorqP8BrpuyiP/e8vmnMS93MuvlZAl5qW3yTt/qTlZngZE5ubS8
         KXbee3/oaOMUDQzXjFAF3ngChPPqjEEbnH3Wb6MdZdVM2WCMa2HN2EJqsM09fZIBz69a
         gGiPHXmxigWaDAH4dDAAUxGINPwyM0z89qMU3P9tENBs9EVeNple6zITgM+cjl+r13nx
         vbl2NWJfGNMvIUadxgDWHcoYnQIX/xVPMCsADki028xrTUS5NsH32hR+OoPXHVMmio15
         LNwaa0Rr09y4KmL7mcYSRSFAZZ+UhnOW23N+MdAv8tJLNdxct3e/bVLNs0oXkPC47yYZ
         NSWA==
X-Forwarded-Encrypted: i=1; AJvYcCVM30vputNKTSK0i815GujTN5T1c6B4B0rKy8sMeG6cXrsUBo9a6uuaKL/YSSYW/MbwJjznc5e+YCz/wA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6tC8r3UH10cz3+FdYvnmQP9SNo7xTYE5RnCVSLY/QU0j5W5VA
	/w3pQUk63skPAaT0wKeRLaTmxidkzIfcjJDMPknyq+aI7WimRqN1f5dtzwlQIJ32nGiHvly4S1I
	0TUKwQUUPn9cT0e9yiQw/t/ArhIftNEy+NL20zweNiTx76gokbhXUPg0LXgOpQUatBw==
X-Gm-Gg: ASbGncsClXUY4zniLb99pAYVCeXFsS3dQZE8qxvuHJWCI8CRvSYkYwUFXWrFLWuNq6S
	9x4AMLloL6ik0WIx8La30uvLjMIq0x+RD8u9huCTfYLStnMG0/wkz486n4oMJ0sx8UHjO2gePhZ
	/SOs1m/NJWXGzQsCqHOIz9d1E004NEkvYutbfoG2xCP1nfXrmAHNXhCfLnzcTPg0Y+cDZkAybq5
	5h63+IHEcjkO1MLfiKD4hPUU+2F2rhEolbqTQSbEJAOX6InQyghLEmreV/Gina+dnwIxAUehdsw
	TsEvo7N5946orIHXKid0Lc4X0tjqewTo7renZLlJLuCLU1xPpwMZGfGcTyz2PzzgCIMSp3834GI
	QvLtEE8Ako/785rEejf4McGEUz9/UaVu+Qut6STmxRO8+/8FfP2Ca7hkkOw==
X-Received: by 2002:a05:622a:4d07:b0:4b7:9b53:4931 with SMTP id d75a77b69052e-4e576ab85e9mr66481121cf.40.1759558707862;
        Fri, 03 Oct 2025 23:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB/luGgFeuFq2gc8pMMZHls+pk4ugbASEUaLSkySS7at3hllWxZalz4bhSCVqzUh5bustxSg==
X-Received: by 2002:a05:622a:4d07:b0:4b7:9b53:4931 with SMTP id d75a77b69052e-4e576ab85e9mr66480941cf.40.1759558707438;
        Fri, 03 Oct 2025 23:18:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011a9154sm2520945e87.115.2025.10.03.23.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 23:18:25 -0700 (PDT)
Date: Sat, 4 Oct 2025 09:18:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm7325-nothing-spacewar: Use
 correct compatible for audiocc
Message-ID: <hnphyvnervdsivywj5x3hgyuy6lhtnls2k3djd4i3z6jid5yjt@y7nja2ga3cqo>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-5-5a45923ef705@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-sc7280-dts-misc-v1-5-5a45923ef705@fairphone.com>
X-Proofpoint-ORIG-GUID: 9hPp4QZca9NumEFu-Xan4wd-7sOSgtRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzMiBTYWx0ZWRfX3gT0yW7VLd2E
 QMCMJWDcidS70VpuHmAVdUha4xdPaTaRkFgg7AiejemO+9AGKtJxntp5C3VALAzlCe8qxO4I/zY
 gZGSAOVW8gofKCRaoZ0kH627wvIVEw2IWtqiGFiYCBFzcfHDymQ5ceUpEf6rqI/7r6Ro05ymRjE
 CE/ywpB4rOnoz0gMpJHN/+j8/kooRxrE99uI5rljj1ItqJRjUQfN0uFH5LmO7161qPaZe2CQgUF
 3wB7O8SUTjSX2zpy5uZ+inCCWqJx7SNPhC99ZV+TWKWZYKDF2x6+FUy7zYCBZVjqohmgzqMOC6W
 9uZ6dtPN6PWsNrBZIGCbHlkDj25NpXpiUGFmlmqMHgQLVdN4DsQWiVHq/6vfzUsSaS8AUsL33iS
 j+G4Ri+s+LSiNDEobWZnVXLnZytymA==
X-Authority-Analysis: v=2.4 cv=D89K6/Rj c=1 sm=1 tr=0 ts=68e0bc35 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=ZWl6vx9Q9smWLlo6MzwA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 9hPp4QZca9NumEFu-Xan4wd-7sOSgtRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040032

On Tue, Sep 30, 2025 at 03:57:05PM +0200, Luca Weiss wrote:
> Use the correct compatible for this phone with standard Qualcomm
> firmware and remove references to power-domains from a 'reserved' node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
