Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13123E49E5;
	Thu, 30 Jul 2026 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401670; cv=fail; b=TJtEIV00rcu7vOgcOSzDaKwu2VEOsuZK/jUPdtIZbldvuDwJzXcLSrS+eFAdRl0dxO120GQIacKdbJVwWCt6pK3mQsHsMr3T+Y0u8aEzBisqWWLn9NKKzF3765+00JLyqI1r8gzPdyP7qgPPKDEzCZG2jYkQz3+u/sO/+PzcMuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401670; c=relaxed/simple;
	bh=zKSoEByX6YRfILwz4BeoqaW1pCvgwt20HkXPKlvvoRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ak9JYkBz1NTaVwEkA/DX2+HCKSSbfRRvUq4x7l2yd7AKeC+/+T8ZwkQCVr5XZ9PHNmjAQrkxZg1h+gh+vE1heDloduIjmepJb3+oq4PdHjMOI0YqJpoRQWBk3/9Q3kcNiGJfgZr1XPCOwzrJQpY/Ce6ixIyrEPaQcc87pcdpx0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IOQYEP5/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=knEWMlL9; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IOQYEP5/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="knEWMlL9"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8rXCs2351204;
	Thu, 30 Jul 2026 03:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ya4ipfqGdCepfnj8KB
	+HZ1d+/EDg8GYqHdN0KAiCadw=; b=IOQYEP5/a/t2sUnDPbBxKXnifaXoTGGH1K
	gs1GTX7iNEeQcWK7euyANSLKObcI74upUsra7udatl5T5tGKVYvYOvxFGNyYwn8s
	Qf9b08zbUA/91b3dHsOL75OAGzUJbhcvA78tFdHvVlsG+05uRXuZTv9obTHOMwza
	mV9oul6Shhq5rbuk5lZ+SnfJrEG0W9nA5ScEO6bmjGVsQvPLK+g+0Q49B2uKdqlC
	/b9vZrIveBpieelml3G5UFxw8TFK+W8FW6nYKHaqcq2ZzVbvBFTnp/kiWB8i2cfc
	NFSQNo26oi97cpmvLyoAHcQAhW9+N7xwX1ukqLQgZ7yuiBG5pqrw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020130.outbound.protection.outlook.com [52.101.61.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fr3g4000t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 03:54:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhA1JSo58RcNQdRvOv2NyXvUIx7XmdKtQxTqL3lpsugBDW45gQ+PXmvljnCk0ab7TN8hHPnoI6gE0Q29qgqXCfQAE/+yGROne7xtAyTRK/0zQU7zR5hmQaIMUR3FIhl9tfoo3vYmmAxyzk5Q5PFe5VZdpIete4NmFOuKL6SdvpKnTM0OxmzJ33EEp9CiQyZtGOO1Y2MrI/E+m3p01CVZHX74zjNuEWQR6DZ1uwXilZNYQuZQnbJU+XUm2YDj4k0KCSmAuOsmblQWPt5ISdKE3SGxMt45LulRqId0UiYEpkh5yLuDT+uuoEaD0RlflSfR34d1cPd4e/u/poK23Zkl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ya4ipfqGdCepfnj8KB+HZ1d+/EDg8GYqHdN0KAiCadw=;
 b=O2SA8kUUMZBXQvAIpMPGJgmsUjk/Y6F1ZyX7zZHTSmOwKxbXe9Zjjmu7e3TXy1cFlqRANqPPEdLonuWdkpSsxb1eDDTB5TnPtXLRdb+hMGXRZzLAFeyZEo22A/ZFhhCVx78T5n724qoD+vmTkPdJqvp45J5rQoNV7FOUi25OD0vOIthJRmJbEv26PkZmjo1EQPrpvXy77nAb2nJXi6sOk1i69uWKAJVOu9TP4gWOiW4ecpLaZiyjdbiHTmjBfzNNY8k9Ngtsn/85J5FoVkLDIF6/TbT0m86ZcsTe5VgF4TMw4xPct4nFSlyrAzliPby+y8d+WzUdORcilruPiadHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ya4ipfqGdCepfnj8KB+HZ1d+/EDg8GYqHdN0KAiCadw=;
 b=knEWMlL9uTRK22hhb0bgZahEikxpru9X6sGagW5hAIBLAJqGTs8RFf+JbO9REEPUp4weV+rD32ywXHLGyOwfv8fuBvXkiotnNgEUgdtwlIzCKHRtxxQjnnuEI69/3memMxBD28Qo+j1tYXhaWcWeSXrlw6tF9RB1kfBJYI1/BR8=
Received: from SA0PR11CA0002.namprd11.prod.outlook.com (2603:10b6:806:d3::7)
 by IA0PPFD4FBFD2D6.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cd0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 08:54:00 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::34) by SA0PR11CA0002.outlook.office365.com
 (2603:10b6:806:d3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Thu,
 30 Jul 2026 08:53:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 08:53:58 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 47D21406541;
	Thu, 30 Jul 2026 08:53:57 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 201A082025A;
	Thu, 30 Jul 2026 08:53:57 +0000 (UTC)
Date: Thu, 30 Jul 2026 09:53:56 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: David Heidelberg <david@ixit.cz>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 5/6] ASoC: cs35l36: Implement set_tdm_slot to program
 RX slot register
Message-ID: <amsRJMxoCPMZXQfI@opensource.cirrus.com>
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
 <aktsvw1IrM7ctTxg@opensource.cirrus.com>
 <1348b108-1034-4ab0-a967-972a9456151d@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348b108-1034-4ab0-a967-972a9456151d@ixit.cz>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|IA0PPFD4FBFD2D6:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bdf9f42-eff1-4457-73c4-08deee18187e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|23010399003|376014|7416014|4143699003|10067099003|6133799003|56012099006|11063799006|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dwkCEpxOWLV69OWmdKsTKyd6L7A7XfvIf41aefT5ZCrmuF5Dwh63SuFbU8bK16iuJWQCLn4253u85PWwUM5Ir5apsTMVeNxdnafA2QKCMg0eXCAGkErcfW8G2wsSjlpwXnaSLtQLG316+JT7gNlLmHJR2HJfwq5dUYsbSqIvz07zb0iFHJCxGA2eJP08sofVsr0X/PDmuiuEUE/gx0XIrTzvH0vLI4oPczJRh/zoGFKciy6HFF7SgtzKUO/XFECsfwwQJjaD4TvMzAZVylIwLreBYV8R2iapsRiIb1l/wXJ/2ginh7nUlKjT28H8uaIHpkDBo093xrWAiFJzZxEjcg2QrBeKRfHw+b+iMHsTD+fN6bIjYOiynH2qDJa1lFnDxT4BfHz3czHHTzHFc6ZrOqE9tdRHpAHrqm4ZV/O4aUE71nDBT3WqbQEK9h+9vq+3qId2iRL1M/ngei2lC/MqiXoKYuzR3kKUEjJ/4riaWv2/wU+yTgcZQHSqW5CSPox+BaGcpgauoYvNQEnWh/HnEZBLe0zU+I0Jp7tp9ZfJWxvLGtJ4zgQ/PVMg2SWJom69CVSLDpXZMGNlptQgRHb0Vs5iFdd2mWVnSM+wf6E3/pE3IO7CPlKLUyyubFOj+gwVPD6DVeI+P/AsGgAZsz8j0Ryn99T+3ySBOMLWtnIrYqo6kqt7pOxQN5iJwidXOv3Zpmr2yw2yKSo2Ew2M2U96gw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(23010399003)(376014)(7416014)(4143699003)(10067099003)(6133799003)(56012099006)(11063799006)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ixpZGtTUKZQ+5+iwXyInOGvnwEWd2dBJZoG5H1mdJreWYrx+plLGxg64IUyB5FraF/2rTezCo03oDAre9q5kMg1FN/gsIPMsodfF/nPxB13NQD5MSDaVdvpZQbJ/Z8wkVMlIrCm13kF5lmD+pwQ7YH0vWu5d7T3iwOMGy/fTx6aO1rb1MBFMidceuanofNJBMDa7+EKMyZceRPEbFxldXJYsfDxN//lo9YQ7vrf35T8V7eSDYehW7DU8BWh6EduUe1++e8nvEwymtIBlGj0C6vfiQmB6CcXpr0jr7bv/PDZw2IBF7Kfoaj0cC4YVtplbeykgbDbBgylkPgSvdJ80YWCeML+d1cap3oV0aWo75zZ2L5Ba8/jauwncZyHw64DVsMbk70iDrRnZxTBoa7aoJn+dtUFLNULSECiUknfdFau0JPb/ohzDJ21uYsb+Sswy
X-Exchange-RoutingPolicyChecked:
	XzHkkq5ynGeiwVm/wdSA9r/x8x9YYxXXHN5ix/PI/qBa50DHV2ODVjeRpfe6d4AhZhsSJQRE+DkQWTx5agozGJcQnd3oEDrW/ZI924Pq510yCw4kilMEoWdZiN6xu7INQby8dd/L7B6lvvVCV+6MYc8nIyp0EmGHqpbipXYv62Vdo9XhtVw4/58XQKnEkBut7hTT1WCJe9hQ9aJi0eieqQrxov9reWGw5WwRwqy6fuhiXgKdSgU3vWGXelDbeA32n5Bo0OX+JlWHbVBHVTttDETsn2jEi+DUzk7LmjiuhkgyNqnAERjRLJk+pllNs3BcM7qIEjNYGBBtOxwRAjt2zw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:53:58.7960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdf9f42-eff1-4457-73c4-08deee18187e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD4FBFD2D6
X-Proofpoint-GUID: gZsIIJBmprCIaBmbjAWCm0rdll9kQpbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2MyBTYWx0ZWRfX/E16ubibFUtX
 WzCHBWe6h1SKzCQYQLWVUGbN+fYFaLkHyBUddzjSk9Ebr7hWZw+liiBl8zriB2zp3jGGSwwkRvO
 JazwRPdr87rFjO7V0x2F2N67WUWvEfTdW8J7WJ7/USWC/2wVh/7BBZTYEXfcZg3qUCIRGOQLXtT
 bbTW6IBLFYbvIkk6b8qdDruf1VdrvHSG9KmLiAxeVnCKTx0CeghreQbLqNUbX3cL39PCkLR2lxV
 RSJaCKHX6fSf86qiJIX7KyKfTy/swMhKTJHMtIDLpTomO7ocx8Ks4r/XV2raatvjxsGzRtQpE3j
 hlTD4gie/NJWjt45bbOorueIQRcOZIr8s6mTLj9uUX+INiWSjQuT9AJeSk4ZxDOWxr0UNITIW8q
 igmcrsVPEj8h0YQ055mHeX2XrqZmN8aCpes3HfKh+LOKJD56hI7bGdhsxf10JOqjyU1APpfSdka
 l5DV4GFY+ObyAwmP4Og==
X-Proofpoint-ORIG-GUID: gZsIIJBmprCIaBmbjAWCm0rdll9kQpbl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2MyBTYWx0ZWRfX6ujRzpu7GyFO
 Um088vMxzKDMRw+okKIIvYtEg1dQ/2IVMi+0sjs/1jGM4JitZYOWlVUVQMqgCKuKF1tCxNIitsT
 MkBEMMf2XJHEpaIYaf1wYAJy3AVSPng=
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a6b112c cx=c_pps
 a=OSa6GUNGlxS2FeKBMPu/EQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=lVS7SSnxuag5pAJLPokA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 29, 2026 at 08:22:42PM +0200, David Heidelberg wrote:
> On 06/07/2026 10:52, Charles Keepax wrote:
> > On Sun, Jul 05, 2026 at 10:06:55PM +0200, David Heidelberg via B4 Relay wrote:
> > > +	if (rx_mask)
> > > +		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RX1_SLOT,
> > > +				   CS35L36_ASP_RX1_SLOT_MASK,
> > > +				   ffs(rx_mask) - 1);
> > 
> > It is more normal for the masks to specify the slot number rather
> > than the bit number, it would probably be nicer to stick with
> > that convention even though it will complicate the code here a
> > little.
> 
> Thank you, is there one of the cs*l* series which implements in similar
> fashion as requested?

sound/soc/codecs/arizona.c, sound/soc/codecs/cs42l43.c or
sound/soc/codecs/cs35l56.c all implement set_tdm, those are
probably reasonable inspiration.

Thanks,
Charles
