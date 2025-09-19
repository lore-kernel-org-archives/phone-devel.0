Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D0C26E6F9
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 17:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301300; cv=none; b=i3mzgBe1KOK0h0HzB+UTZIMgmWf6riMEbI99Z84m03RNIB4TvEv8Q8X0QZ/6wFAQgkkVBUbj5wWl7lMuMMU9iqYR2cvZo32v4d1+aPj/qQquK7xqBWDez6Ocu8UumKGHUQ3rd+9a6EtvpbZQ/5jbzyZuQoatKiYNLbtN9Gloo0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301300; c=relaxed/simple;
	bh=trDFBwc1oiaJoVJrQfez6m7oAuetfw6BHTNzouIaVYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DriRw9j29J0hEzGHEaRch8nrNaaQ4LDQyBv0uzHuzD0A7K9NXWbk0ifBkXmKEqoorNTQ8zMddEUnEwPopiFMnkudvMbdkIycm2WG+33h8adYXtntlD3rO4lwX3S6hfUrk049j/58vv7ifKof2W0EsImnrDX82izxR1FYqjmGYIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7e06cpu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7e06cpu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JDXBxB030598
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 17:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/GJuqjnHkULWUhGDoYaDaK5l
	06w+po27C73CLRMK/x8=; b=U7e06cpuONegCJPqkZYtg4UUJJ3u5dYyrZVSO9mv
	ELIRgnZlemXDNkiJem8hUC9qqsqQHeul2tSlOAixcWaZ9BEWp+D26kpmx6QJizvb
	3BASD7r2p8JrVEMo6ok508AyBmMoxc9ebaA+eYmR9xF5gHyNIIoRh/Pg0OgoJpsp
	GzNk50xwDnhk60IkNeQikoAQ6cLjMGVR25M1d9C1rwt7pl9NxOaPjLOHIyz/TWi8
	aAU0s/mipFfhHQ1LVDpwr0+8mz9fy/BJXezvcaBw3JaFfvE0Js61HH5buv6n8qHU
	I3ZxhjRpDWBsvZhyKTt88C6d93rSWE5BoRu65iXNd4D5rw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49916x21d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 17:01:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-54a6ef0e4dcso2233981e0c.1
        for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 10:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758301297; x=1758906097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GJuqjnHkULWUhGDoYaDaK5l06w+po27C73CLRMK/x8=;
        b=qfzgQ9fo9vLVXCFwrHk+YdsuHTskZQzal72v9O4DIjZaM3gXB6UfQTYOiBmQiDJq5G
         ng4ZeF3nN8fgjI2fsUWFbt6xqu1t6Jm1UUjSXztKmbWuca0UzVpY0Entqhyo52yX9HhD
         8qZKbelbyKTcX5DOtltGNjPUTY4/g55Paxre3XTq5ZBkJfZvNSl8GCFWEv709XmHsKzx
         kA2UBInMGZTmwTDZ35TCT1qtgdOQ4eLo1LVE2Qjx/CBdWDqbiJtAwLTVnGfjRJXU56zg
         iABeChvGOPtb5GhUE/HAuAZAD2hcLMRqPFhgDcckf+PsxYmnHItoPFKzlcdqgZgrzVzf
         z3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWhDxhv55lo2PzTJMF3TFDoZKz4FfE2lol+AQVU0A2KCOGEYOUHyO6XUIOkc3V++bc/ZDpqGWpU4i8hig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm/+wCx8k9bhZSM8rIMJcDziuCfJ1afnOky1aGpBlMxbPNKfxU
	KvrGlbyIy0TBec3O4Cl29NYTqbjhkGy/8vUJejqyWRgjsp9XwCBB7zb3p5LGBnOFwk9Vi77f5pJ
	2mwJyGwtZzsGWXm3gtHfVtfXdiIdLouoYHukdQxKZslptX7DbLi8AILP8LnojE5QR0g==
X-Gm-Gg: ASbGncutUd5spOSNaoUSEDHNp1/PA/CiAxFo12Zaqx/gcIhejikry7WDXdDWHzInGja
	fug84Ry+fimeSKuIKhH4D7Y7wcirJR6hsjm3yqj6sF2bk2VVsMqsVTQasLtTmsfCc3AsSvtvLGD
	a0QetiYzOukzWASAayDiZnQduNj9rTxB+A3MBfNciUAW7HN5203IohixKGlYH34jdkML4DM8ivp
	A8WC+0lWRepRl8M4W469LBU2u8+S7U+jUS7H0I76wuYct8X3IZ7vam2Q+qhpK+E0cPff5ythLDP
	i5cB1FWV5RtdxcNIyhkwhhjFixdy+ya9waeDcaGJydS32yBzboO/FlvcdX1BNbJKHeZnA6Vy/b4
	4oopxtVGABnKeUTSlOWCW9aIgvP5OBQuEmQCVj0SSoYRWXTI0bCPd
X-Received: by 2002:a05:6122:8c02:b0:544:a84d:d3ac with SMTP id 71dfb90a1353d-54a837797c7mr1542741e0c.5.1758301296840;
        Fri, 19 Sep 2025 10:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRMwUFcNmD6+H4WWbQh7maNAmSeRlq1FmZoBVrzLMBe9fiOHdTW1rugEpaVEScuqRpuuBjoQ==
X-Received: by 2002:a05:6122:8c02:b0:544:a84d:d3ac with SMTP id 71dfb90a1353d-54a837797c7mr1542622e0c.5.1758301296167;
        Fri, 19 Sep 2025 10:01:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44823sm1510808e87.6.2025.09.19.10.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 10:01:35 -0700 (PDT)
Date: Fri, 19 Sep 2025 20:01:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jens Reidel <adrian@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        David Wronek <david@mainlining.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sm7150: Add MDSS_CORE reset
Message-ID: <rxjhl4t22x4472x7qjxe5nq4uwoogkuyqzqz4imdtnmeibucp4@yesphve6yat4>
References: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
 <20250919-sm7150-dispcc-fixes-v1-2-308ad47c5fce@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-sm7150-dispcc-fixes-v1-2-308ad47c5fce@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA0OCBTYWx0ZWRfX8mMDkJ/f90ZO
 8iuKDz1lsMVS8cnf/ZmBQLGAnLYw0TG5YQ3NOGvJgCP/glPH0CpLYg2L4lpJ6sB8/3C3cvL5l8R
 UF+k+IH++QVBf8PJjv6jRuTM6UficML/0rvpXIOJl2kbtlF4+DAjgu6ihZI+w5OVzqyNNisujSY
 6YUoMSFJcZrGlyRfjkYM181CKp1HY9aAa/D9k9GlglYzYm1KQ7GWr/yVKW6S6p/t91YOthFzFXT
 /YxhU542qyG87zJ4qb8ITXrByfDF0b26D27mJOm1Z/3b7ElEDhxMqMWjwgle1bccyhryuyZ+L2T
 99leQ8Js84TWOd6EV68z+6lKi9E3SdPfeGuQ19oVU13NbtfQD+7/tUFtPJjB9yd5gLKDap3aoXK
 lUKKip3n
X-Proofpoint-GUID: S98cqDNJoGpkKOJMejYjCSgCVMCgOTzo
X-Authority-Analysis: v=2.4 cv=LcM86ifi c=1 sm=1 tr=0 ts=68cd8c72 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=1MwS7L9duvxXQ3yU_sEA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: S98cqDNJoGpkKOJMejYjCSgCVMCgOTzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509190048

On Fri, Sep 19, 2025 at 02:34:31PM +0200, Jens Reidel wrote:
> Add the offsets for a reset inside the dispcc on SM7150 SoC.
> 
> Signed-off-by: Jens Reidel <adrian@mainlining.org>
> ---
>  drivers/clk/qcom/dispcc-sm7150.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
